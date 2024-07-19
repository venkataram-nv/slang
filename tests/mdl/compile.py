import os
import shutil
import glob
import subprocess
import argparse
import halo
import sys
import prettytable

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
parser.add_argument('--target', type=str, default='spirv', choices=['spirv', 'spirv-glsl', 'dxil'])
parser.add_argument('--samples', type=int, default=1)

args = parser.parse_args(sys.argv[1:])

dxc = 'dxc.exe'
slangc = '..\\..\\build\\Release\\bin\\slangc.exe'
target = args.target
samples = args.samples

if target == 'spirv':
    target = 'spirv -emit-spirv-directly'
if target == 'spirv-glsl':
    target = 'spirv -emit-spirv-via-glsl'

print(f'slangc:  {slangc}')
print(f'target:  {target}')
print(f'samples: {samples}\n')

### Utility ###

def parse(results):
    results = results.split('\n')[:-1]
    results = [ r.strip() for r in results ]
    results = [ r.split('#') for r in results if len(r) > 0 ]
    results = { r[0].strip() : float(r[1][:-1]) for r in results }
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
        run(f'{slangc} {file} -stage closesthit -entry closesthit -o modules/closesthit.slang-module', 'closesthit')
        run(f'{slangc} {file} -stage anyhit -entry anyhit -o modules/anyhit.slang-module', 'anyhit')
        run(f'{slangc} {file} -stage anyhit -entry shadow -o modules/shadow.slang-module', 'shadow')
    else:
        run(f'{slangc} {file} -o modules/{file}-module', file.split(':')[0])
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

if target.startswith('spirv'):
    base = '-T lib_6_1 -Vd -spirv -fspv-target-env=vulkan1.3 sdk-generated/link_unit_code.hlsl' 
    def dxc_closesthit():
        subprocess.call(f'{dxc} {base} -fspv-entrypoint-name=closesthit -Fo targets/dxr-ch-dxc.spv')

    def dxc_anyhit():
        subprocess.call(f'{dxc} {base} -fspv-entrypoint-name=anyhit -Fo targets/dxr-ah-dxc.spv')

    def dxc_shadow():
        subprocess.call(f'{dxc} {base} -fspv-entrypoint-name=shadow -Fo targets/dxr-sh-dxc.spv')
else:
    base = '-T lib_6_1 -Vd sdk-generated/link_unit_code.hlsl' 
    # base = '-T lib_6_5 sdk-generated/link_unit_code.hlsl' 
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

### Timings ####

dwn_headers = [ 'Link & Optimize', 'Semantic Checking' ]
dwn_keys = [ 'Slang::linkAndOptimizeIR', 'SemanticChecking' ]

if target.endswith('-emit-spirv-directly'):
    dwn_headers.append('Emit Spirv')
    dwn_keys.append('Slang::emitSPIRVFromIR')
    
    dwn_headers.append('Spirv-Opt')
    dwn_keys.append('SpirvOpt')
elif target.endswith('-emit-spirv-via-glsl'):
    dwn_headers.append('Glslang')
    dwn_keys.append('Slang::GlslangDownstreamCompiler::compile')
else:
    dwn_headers.append('DXC Downstream')
    dwn_keys.append('Slang::DXCDownstreamCompiler::compile')

def info_module_compilation():
    module_precompilation = 0
    for k, db in timings.items():
        module_precompilation += db['spCompile']

    print()
    print(f'**Module precompilation ({module_precompilation:.3f}s)**')

def info_module_whole_compilation():
    ch_module = timings['$closesthit-module']['spCompile']
    ah_module = timings['$anyhit-module']['spCompile']
    sh_module = timings['$shadow-module']['spCompile']
    total_module = ch_module + ah_module + sh_module
    
    print()
    print(f'**Module whole compilation ({total_module:.3f}s)**')

    table = prettytable.PrettyTable()
    table.set_style(prettytable.MARKDOWN)
    table.field_names = [ 'Entry', 'Total' ] + dwn_headers
    
    entries = [ 'Closest Hit', 'Any Hit', 'Shadow' ]
    prefixes = [ '$closesthit', '$anyhit', '$shadow' ]

    for entry, prefix in zip(entries, prefixes):
        row = [ entry ]
        key = prefix + '-module'
        db = timings[key]

        spCompile = db['spCompile']
        row.append(f'{spCompile:.3f}s')

        for key in dwn_keys:
            time = db[key]
            frac = 100 * time/spCompile
            row.append(f'{time:.3f}s *({frac:.1f}%)*')
        
        table.add_row(row)

    print(table)
    
    return ch_module, ah_module, sh_module, total_module

def info_monolithic_compilation():
    ch_mono = timings['$closesthit-mono']['spCompile']
    ah_mono = timings['$anyhit-mono']['spCompile']
    sh_mono = timings['$shadow-mono']['spCompile']
    total_mono = ch_mono + ah_mono + sh_mono

    print()
    print(f'**Monolithic compilation ({total_mono:.3f}s)**')
    
    table = prettytable.PrettyTable()
    table.set_style(prettytable.MARKDOWN)
    table.field_names = [ 'Entry', 'Total' ] + dwn_headers
    
    entries = [ 'Closest Hit', 'Any Hit', 'Shadow' ]
    prefixes = [ '$closesthit', '$anyhit', '$shadow' ]

    for entry, prefix in zip(entries, prefixes):
        row = [ entry ]
        key = prefix + '-mono'
        db = timings[key]

        spCompile = db['spCompile']
        row.append(f'{spCompile:.3f}s')

        for key in dwn_keys:
            time = db[key]
            frac = 100 * time/spCompile
            row.append(f'{time:.3f}s *({frac:.1f}%)*')
        
        table.add_row(row)

    print(table)

    return ch_mono, ah_mono, sh_mono, total_mono

def info_dxc_compilation():
    print()
    print(f'**DXC for original HLSL ({total_dxc:.3f}s)**')
    
    table = prettytable.PrettyTable()
    table.set_style(prettytable.MARKDOWN)
    table.field_names = [ 'Entry', 'Total' ]
    table.add_row([ 'Closest Hit', f'{ch_dxc:.3f}s' ])
    table.add_row([ 'Any Hit', f'{ah_dxc:.3f}s' ])
    table.add_row([ 'Shadow ', f'{sh_dxc:.3f}s' ])
    print(table)
    
    return ch_dxc, ah_dxc, sh_dxc, total_dxc

def info_speed_up_factors(modl, mono, dxcc):
    print()
    print(f'**Speed up factors**')

    table = prettytable.PrettyTable()
    table.set_style(prettytable.MARKDOWN)
    table.field_names = [ 'Entry', 'vs. Monolithic', 'vs. DXC' ]
    table.add_row([ 'Total', f'{mono[3]/modl[3]:.3f}x', f'{dxcc[3]/modl[3]:.3f}x' ])
    table.add_row([ 'Closest Hit', f'{mono[0]/modl[0]:.3f}x', f'{dxcc[0]/modl[0]:.3f}x' ])
    table.add_row([ 'Any Hit', f'{mono[1]/modl[1]:.3f}x', f'{dxcc[1]/modl[1]:.3f}x' ])
    table.add_row([ 'Shadow', f'{mono[2]/modl[2]:.3f}x', f'{dxcc[2]/modl[2]:.3f}x' ])
    print(table)

info_module_compilation()
modl = info_module_whole_compilation()
mono = info_monolithic_compilation()
dxcc = info_dxc_compilation()
info_speed_up_factors(modl, mono, dxcc)