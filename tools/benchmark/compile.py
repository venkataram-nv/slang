import os
import shutil
import glob
import subprocess
import argparse
import sys
import prettytable

### Setup ###

def clear_mkdir(dir):
    if os.path.exists(dir):
        shutil.rmtree(dir)

    os.makedirs(dir, exist_ok=True)

clear_mkdir('targets')
clear_mkdir('modules')

for file in glob.glob(f'*.slang-module'):
    os.remove(file)

repo = 'slang-benchmarks'
if not os.path.exists(repo):
    repo = 'ssh://git@gitlab-master.nvidia.com:12051/slang/slang-benchmarks.git'
    command = f'git clone {repo}'
    subprocess.check_output(command)
    os.system('cp slang-benchmarks/mdl/* .')

### Script arguments ####

target_choices = ['spirv', 'spirv-glsl', 'dxil', 'dxil-embedded']

parser = argparse.ArgumentParser()
parser.add_argument('--target', type=str, default='spirv', choices=target_choices)
parser.add_argument('--samples', type=int, default=1)
parser.add_argument('--output', type=str, default='benchmarks.json')
parser.add_argument('--ci', action='store_true')

args = parser.parse_args(sys.argv[1:])

dxc = 'dxc.exe'
slangc = '..\\..\\build\\Release\\bin\\slangc.exe'
target = args.target
samples = args.samples

if target == 'spirv':
    target = 'spirv -emit-spirv-directly'
    target_ext = 'spirv'
    embed = False
elif target == 'spirv-glsl':
    target = 'spirv -emit-spirv-via-glsl'
    target_ext = 'spirv'
    embed = False
elif target == 'dxil-embedded':
    target_ext = 'dxil -profile lib_6_6 '
    embed = True
elif target == 'dxil':
    target_ext = 'dxil'
    embed = False

print(f'slangc:  {slangc}')
print(f'target:  {target}')
print(f'samples: {samples}\n')

### Utility ###

def parse(results):
    results = results.split('\n')
    results = [ r for r in results if r.startswith('[*]') ]
    results = [ r.split() for r in results ]
    profile = {}
    for r in results:
        profile[r[1]] = float(r[-1][:-2])
    return profile

timings = {}
def run(command, key):
    print(f'cmd: {command}')

    profile = {}
    for i in range(samples):
        try:
            results = subprocess.check_output(command, stderr=subprocess.STDOUT, shell=True).decode('utf-8')
        except subprocess.CalledProcessError as exc:
            print(f'Error occurred when running the command: {command}')
            print(exc.output.decode('utf-8'))
            # return
            exit(-1)

        p = parse(results)
        if len(profile) == 0:
            profile = p
        else:
            for k, v in p.items():
                profile.setdefault(k, 0)
                profile[k] += v

    for k in profile:
        profile[k] /= samples

    timings[key] = profile

def compile_cmd(file, output, stage=None, entry=None, emit=False):
    cmd = f'{slangc} -report-perf-benchmark {file}'

    if stage:
        cmd += f' -stage {stage}'
        if entry:
            cmd += f' -entry {entry}'
        else:
            cmd += f' -entry {stage}'

    if emit:
        cmd += f' -target {target_ext}'
        output += '.' + target_ext
    elif embed:
        cmd += ' -embed-dxil'
        # cmd += ' -profile lib_6_6'
        # cmd += ' -incomplete-library'

    cmd += f' -o {output}'

    return cmd

### Monolithic entry point compilation ###

hit = 'hit.slang'

cmd = compile_cmd(hit, f'targets/dxr-ch-mono', stage='closesthit', emit=True)
run(cmd, f'full/{target_ext}/mono/closesthit')
print(f'[I] compiled shadow (monolithic)')

cmd = compile_cmd(hit, f'targets/dxr-ah-mono', stage='anyhit', emit=True)
run(cmd, f'full/{target_ext}/mono/anyhit')
print(f'[I] compiled shadow (monolithic)')

cmd = compile_cmd(hit, f'targets/dxr-sh-mono', stage='anyhit', entry='shadow', emit=True)
run(cmd, f'full/{target_ext}/mono/shadow')
print(f'[I] compiled shadow (monolithic)')

### Module precompilation ###

for file in glob.glob(f'*.slang'):
    if file.endswith('hit.slang'):
        continue

    basename = os.path.basename(file)
    run(compile_cmd(file, f'{basename}-module'), 'module/' + file)
    print(f'[I] compiled {file}.')

### Module entry point compilation ###

cmd = compile_cmd(hit, f'targets/dxr-ch-modules', stage='closesthit', emit=True)
run(cmd, f'full/{target_ext}/module/closesthit')
print(f'[I] compiled closesthit (module)')

cmd = compile_cmd(hit, f'targets/dxr-ah-modules', stage='anyhit', emit=True)
run(cmd, f'full/{target_ext}/module/anyhit')
print(f'[I] compiled anyhit (module)')

cmd = compile_cmd(hit, f'targets/dxr-sh-modules', stage='anyhit', entry='shadow', emit=True)
run(cmd, f'full/{target_ext}/module/shadow')
print(f'[I] compiled shadow (module)')

### Module precompilation time ###

precompilation_time = 0
for k in timings:
    if k.startswith('module'):
        precompilation_time += timings[k]['compileInner']

timings[f'full/{target_ext}/precompilation'] = { 'compileInner': precompilation_time }

### Generate readable Markdown ###

print(4 * '\n')
print('# Slang MDL benchmark results\n')

print('## Module precompilation time\n')
print(f'Total: **{timings[f'full/{target_ext}/precompilation']['compileInner']} ms**\n')

print('## Module compilation for entry points\n')

entries = [ 'Closest Hit', 'Any Hit', 'Shadow' ]
prefixes = [ 'closesthit', 'anyhit', 'shadow' ]

table = prettytable.PrettyTable()
table.set_style(prettytable.MARKDOWN)
table.field_names = [ 'Entry', 'Total' ]

total = 0
for entry, prefix in zip(entries, prefixes):
    row = [ entry ]
    db = timings[f'full/{target_ext}/module/{prefix}']
    spCompile = db['compileInner']
    row.append(f'{spCompile:.3f}s')
    table.add_row(row)
    total += spCompile

print(f'Total: **{total} ms**\n')
print(table, end='\n\n')

print('## Monolithic compilation for entry points\n')

table = prettytable.PrettyTable()
table.set_style(prettytable.MARKDOWN)
table.field_names = [ 'Entry', 'Total' ]

total = 0
for entry, prefix in zip(entries, prefixes):
    row = [ entry ]
    db = timings[f'full/{target_ext}/mono/{prefix}']
    spCompile = db['compileInner']
    row.append(f'{spCompile:.3f}s')
    table.add_row(row)
    total += spCompile

print(f'Total: **{total} ms**\n')
print(table, end='\n\n')