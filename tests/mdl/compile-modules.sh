# set -e

alias slangc=../../build/Release/bin/slangc.exe

mkdir -p modules

header() {
	echo "
===========================
$1
==========================="
}

list=""
files=""
for file in *.slang; do
	if ! [ -f "$file" ]; then
		continue
	fi

	header "file: $file"
	if [ "$file" = "hit.slang" ]; then
		time slangc $file -entry closesthit -o modules/closesthit.slang-module
		time slangc $file -entry anyhit -o modules/anyhit.slang-module
		time slangc $file -entry shadow -o modules/shadow.slang-module

		files="modules/closesthit.slang-module
		modules/anyhit.slang-module
		modules/shadow.slang-module
		$files"
	else
		time slangc $file -o modules/$file-module
		list="modules/$file-module $list"
		files="modules/$file-module
		$files"
	fi
done

header "compiling altogether:"

echo "
$files"

time slangc $list modules/closesthit.slang-module -target dxil -entry closesthit -o dxr.dxil
time slangc $list modules/anyhit.slang-module -target dxil -entry anyhit -o dxr.dxil
time slangc $list modules/shadow.slang-module -target dxil -entry shadow -o dxr.dxil

header "monolithic compilation:"

time slangc hit.slang -target dxil -entry closesthit -o dxr-monolothic.dxil
time slangc hit.slang -target dxil -entry anyhit -o dxr-monolothic.dxil
time slangc hit.slang -target dxil -entry shadow -o dxr-monolothic.dxil

# read -p "dump spirv-asm? (y/n): " confirm
# if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
# 	spirv-dis dxr.spirv
# 	echo "
# 	# of spirv insts. (approx.): " $(spirv-dis dxr.spirv | wc -l)
# fi
