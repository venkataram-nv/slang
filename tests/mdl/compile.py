import os
import shutil
import glob
import subprocess
import argparse
import halo
import sys

def clear_mkdir(dir):
    if os.path.exists(dir):
        shutil.rmtree(dir)
    os.makedirs(dir, exist_ok=True)

clear_mkdir('modules')
clear_mkdir('targets')

parser = argparse.ArgumentParser()
parser.add_argument('--target', type=str, default='spirv', choices=['spirv', 'dxil'])
parser.add_argument('--samples', type=int, default=1)

args = parser.parse_args(sys.argv[1:])

slangc = '../../build/Release/bin/slangc'
target = args.target
samples = args.samples

print(f'slangc: {slangc}')
print(f'target: {target}')
print(f'samples: {samples}')

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

### Modules ###

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

### Monolithic ###

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

### Timings ####

print('results:')

module_precompilation = 0
for k, db in timings.items():
    module_precompilation += db['spCompile']

print(f'    module precompilation    {module_precompilation:.3f}s')

ch_module = timings['$closesthit-module']['spCompile']
ah_module = timings['$anyhit-module']['spCompile']
sh_module = timings['$shadow-module']['spCompile']
total_module = ch_module + ah_module + sh_module

print(f'    module whole compilation {total_module:.3f}s')
print(f'        closeshit {ch_module:.3f}s')
print(f'        anyhit    {ah_module:.3f}s')
print(f'        shadow    {sh_module:.3f}s')

ch_mono = timings['$closesthit-mono']['spCompile']
ah_mono = timings['$anyhit-mono']['spCompile']
sh_mono = timings['$shadow-mono']['spCompile']
total_mono = ch_mono + ah_mono + sh_mono

print(f'    monolithic compilation   {total_mono:.3f}s')
print(f'        closeshit {ch_mono:.3f}s')
print(f'        anyhit    {ah_mono:.3f}s')
print(f'        shadow    {sh_mono:.3f}s')

ch_factor = ch_mono/ch_module
ah_factor = ah_mono/ah_module
sh_factor = sh_mono/sh_module
total_factor = total_mono/total_module

print(f'    speed up factor          {total_factor:.2f}x')
print(f'        closeshit {ch_factor:.2f}x')
print(f'        closeshit {ah_factor:.2f}x')
print(f'        closeshit {sh_factor:.2f}x')
