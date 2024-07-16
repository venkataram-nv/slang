import os
import shutil
import glob
import subprocess
import argparse
import halo
import sys

from timeit import timeit

### Setup ###

def clear_mkdir(dir):
    if os.path.exists(dir):
        shutil.rmtree(dir)
    os.makedirs(dir, exist_ok=True)

clear_mkdir('modules')
clear_mkdir('targets')
clear_mkdir('targets/generated')

parser = argparse.ArgumentParser()
parser.add_argument('--target', type=str, default='spirv', choices=['spirv', 'dxil'])
parser.add_argument('--samples', type=int, default=1)

args = parser.parse_args(sys.argv[1:])

dxc = 'dxc.exe'
slangc = '..\\..\\build\\Release\\bin\\slangc.exe'
target = args.target
samples = args.samples

print(f'slangc:  {slangc}')
print(f'target:  {target}')
print(f'samples: {samples}\n')

### Utility ###

def parse(results):
    results = results.split('\n')[:-1]
    results = [ r.strip() for r in results ]
    results = [ r.split(':') for r in results ]
    results = { r[0] : float(r[1][:-1]) for r in results }
    return results

timings = {}
def run(command, key):
    results = subprocess.check_output(command, shell=True).decode('utf-8')
    results = parse(results)

    for i in range(samples - 1):
        r = subprocess.check_output(command, shell=True).decode('utf-8')
        r = parse(r)
        for k, v in r.items():
            results[k] += v

    for k, v in results.items():
        results[k] /= samples

    timings[key] = results

### Module precompilation ###

spinner = halo.Halo(text=' compiling modules...', spinner='dots')
spinner.start()

modules = []
for file in glob.glob('*.slang'):
    if file.startswith('hit'):
        command = f'{slangc} {file} -stage closesthit -entry closesthit -o modules/closesthit.slang-module'
        run(command, 'closesthit')

        command = f'{slangc} {file} -stage anyhit -entry anyhit -o modules/anyhit.slang-module'
        run(command, 'anyhit')

        command = f'{slangc} {file} -stage anyhit -entry shadow -o modules/shadow.slang-module'
        run(command, 'shadow')
    else:
        command = f'{slangc} {file} -o modules/{file}-module'
        run(command, file.split(':')[0])

        modules.append(f'modules/{file}-module')

    spinner.info(f' compiled {file}.')
    spinner.start()

spinner.stop()

### Entry compilation with precompiled slang modules ###

spinner = halo.Halo(text='compiling targets...', spinner='dots')
spinner.start()

modules = ' '.join(modules)

command = f'{slangc} {modules} modules/closesthit.slang-module -target {target} -stage closesthit -entry closesthit -o targets/dxr-ch-modules.{target}'
run(command, '$closesthit-module')

spinner.info(f' compiled closeshit (module).')
spinner.start()

command = f'{slangc} {modules} modules/anyhit.slang-module -target {target} -stage anyhit -entry anyhit -o targets/dxr-ah-modules.{target}'
run(command, '$anyhit-module')

spinner.info(f' compiled anyhit (module).')
spinner.start()

command = f'{slangc} {modules} modules/shadow.slang-module -target {target} -stage anyhit -entry shadow -o targets/dxr-sh-modules.{target}'
run(command, '$shadow-module')

spinner.info(f' compiled shadow (module).')
spinner.start()

### Monolithic compilation with slangc ###

command = f'{slangc} hit.slang -target {target} -stage closesthit -entry closesthit -o targets/dxr-ch-monolithic.{target}'
run(command, '$closesthit-mono')

spinner.info(f' compiled closesthit (mono).')
spinner.start()

command = f'{slangc} hit.slang -target {target} -stage anyhit -entry anyhit -o targets/dxr-ah-monolithic.{target}'
run(command, '$anyhit-mono')

spinner.info(f' compiled anyhit (mono).')
spinner.start()

command = f'{slangc} hit.slang -target {target} -stage anyhit -entry shadow -o targets/dxr-sh-monolithic.{target}'
run(command, '$shadow-mono')

spinner.info(f' compiled shadow (mono).')

### DXC with original HLSL ###

# TODO: check with DXIL output
if target == 'spirv':
    base = '-T lib_6_1 -Vd -spirv -fspv-target-env=vulkan1.3 sdk-generated/link_unit_code.hlsl' 
    def dxc_closesthit():
        subprocess.call(f'{dxc} {base} -fspv-entrypoint-name=closesthit -Fo targets/dxr-ch-dxc.spv')

    def dxc_anyhit():
        subprocess.call(f'{dxc} {base} -fspv-entrypoint-name=anyhit -Fo targets/dxr-ah-dxc.spv')

    def dxc_shadow():
        subprocess.call(f'{dxc} {base} -fspv-entrypoint-name=shadow -Fo targets/dxr-sh-dxc.spv')
else:
    base = '-T lib_6_1 -Vd sdk-generated/link_unit_code.hlsl' 
    def dxc_closesthit():
        subprocess.call(f'{dxc} {base} -E closesthit -Fo targets/dxr-ch-dxc.dxil')
    
    def dxc_anyhit():
        subprocess.call(f'{dxc} {base} -E anyhit -Fo targets/dxr-ah-dxc.dxil')
    
    def dxc_shadow():
        subprocess.call(f'{dxc} {base} -E shadow -Fo targets/dxr-sh-dxc.dxil')

with halo.Halo(text='compiling with dxc...', spinner='dots') as spinner:
    ch_dxc = timeit(dxc_closesthit, number=samples) / samples
    spinner.info('compiled closeshit (dxc).')
    spinner.start()

    ah_dxc = timeit(dxc_anyhit, number=samples) / samples
    spinner.info('compiled anyhit (dxc).')
    spinner.start()

    sh_dxc = timeit(dxc_shadow, number=samples) / samples
    spinner.info('compiled shadow (dxc).')

    total_dxc = ch_dxc + ah_dxc + sh_dxc

### DXC with slangc generated HLSL ###

ch_source = 'targets/generated/mdl-closesthit.hlsl'
ah_source = 'targets/generated/mdl-anyhit.hlsl'
sh_source = 'targets/generated/mdl-shadow.hlsl'

with halo.Halo(text='generating shaders...', spinner='dots') as spinner:
    base = f'{slangc} -target hlsl hit.slang'

    subprocess.call(f'{base} -stage closesthit -entry closesthit -o {ch_source}')
    spinner.info('generated shader for closesthit')
    spinner.start()
    
    subprocess.call(f'{base} -stage anyhit -entry anyhit -o {ah_source}')
    spinner.info('generated shader for anyhit')
    spinner.start()
    
    subprocess.call(f'{base} -stage anyhit -entry shadow -o {sh_source}')
    spinner.info('generated shader for shadow')

if target == 'spirv':
    base = '-T lib_6_1 -Vd -spirv -fspv-target-env=vulkan1.3'
    def dxc_closesthit():
        subprocess.call(f'{dxc} {base} {ch_source} -fspv-entrypoint-name=closesthit -Fo targets/dxr-ch-dxc.spv')

    def dxc_anyhit():
        subprocess.call(f'{dxc} {base} {ah_source} -fspv-entrypoint-name=anyhit -Fo targets/dxr-ah-dxc.spv')

    def dxc_shadow():
        subprocess.call(f'{dxc} {base} {sh_source} -fspv-entrypoint-name=shadow -Fo targets/dxr-sh-dxc.spv')
else:
    base = '-T lib_6_1 -Vd'
    def dxc_closesthit():
        subprocess.call(f'{dxc} {base} {ch_source} -E closesthit -Fo targets/dxr-ch-dxc.spv')

    def dxc_anyhit():
        subprocess.call(f'{dxc} {base} {ah_source} -E anyhit -Fo targets/dxr-ah-dxc.spv')

    def dxc_shadow():
        subprocess.call(f'{dxc} {base} {sh_source} -E shadow -Fo targets/dxr-sh-dxc.spv')

with halo.Halo(text='compiling with dxc...', spinner='dots') as spinner:
    ch_dxc_gen = timeit(dxc_closesthit, number=samples) / samples
    spinner.info('compiled closeshit (dxc & gen).')
    spinner.start()

    ah_dxc_gen = timeit(dxc_anyhit, number=samples) / samples
    spinner.info('compiled anyhit (dxc & gen).')
    spinner.start()

    sh_dxc_gen = timeit(dxc_shadow, number=samples) / samples
    spinner.info('compiled shadow (dxc & gen).')

    total_dxc_gen = ch_dxc_gen + ah_dxc_gen + sh_dxc_gen

### Timings ####

print('\nresults:')

module_precompilation = 0
for k, db in timings.items():
    module_precompilation += db['spCompile']

print(f'\n    module precompilation    {module_precompilation:.3f}s')

ch_module = timings['$closesthit-module']['spCompile']
ah_module = timings['$anyhit-module']['spCompile']
sh_module = timings['$shadow-module']['spCompile']
total_module = ch_module + ah_module + sh_module

print(f'\n    module whole compilation {total_module:.3f}s')
print(f'        closeshit {ch_module:.3f}s')
print(f'        anyhit    {ah_module:.3f}s')
print(f'        shadow    {sh_module:.3f}s')

ch_mono = timings['$closesthit-mono']['spCompile']
ah_mono = timings['$anyhit-mono']['spCompile']
sh_mono = timings['$shadow-mono']['spCompile']
total_mono = ch_mono + ah_mono + sh_mono

print(f'\n    monolithic compilation   {total_mono:.3f}s')
print(f'        closeshit {ch_mono:.3f}s')
print(f'        anyhit    {ah_mono:.3f}s')
print(f'        shadow    {sh_mono:.3f}s')

ch_factor = ch_mono/ch_module
ah_factor = ah_mono/ah_module
sh_factor = sh_mono/sh_module
total_factor = total_mono/total_module

print(f'\n    speed up (vs mono)       {total_factor:.2f}x')
print(f'        closeshit {ch_factor:.2f}x')
print(f'        anyhit    {ah_factor:.2f}x')
print(f'        shadow    {sh_factor:.2f}x')

print(f'\n    dxc for original hlsl    {total_dxc:.3f}s')
print(f'        closeshit {ch_dxc:.3f}s')
print(f'        anyhit    {ah_dxc:.3f}s')
print(f'        shadow    {sh_dxc:.3f}s')

ch_factor = ch_dxc/ch_module
ah_factor = ah_dxc/ah_module
sh_factor = sh_dxc/sh_module
total_factor = total_dxc/total_module

print(f'\n    speed up (vs dxc)        {total_factor:.2f}x')
print(f'        closeshit {ch_factor:.2f}x')
print(f'        anyhit    {ah_factor:.2f}x')
print(f'        shadow    {sh_factor:.2f}x')

print(f'\n    dxc for generated hlsl   {total_dxc_gen:.3f}s')
print(f'        closeshit {ch_dxc_gen:.3f}s')
print(f'        anyhit    {ah_dxc_gen:.3f}s')
print(f'        shadow    {sh_dxc_gen:.3f}s')

ch_factor = ch_dxc_gen/ch_module
ah_factor = ah_dxc_gen/ah_module
sh_factor = sh_dxc_gen/sh_module
total_factor = total_dxc_gen/total_module

print(f'\n    speed up (vs dxc & gen)  {total_factor:.2f}x')
print(f'        closeshit {ch_factor:.2f}x')
print(f'        anyhit    {ah_factor:.2f}x')
print(f'        shadow    {sh_factor:.2f}x')