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
		echo ""
		echo "Closest hit shader:"
		slangc $file -entry closesthit -o modules/closesthit.slang-module
		echo "Any hit shader:"
		slangc $file -entry anyhit -o modules/anyhit.slang-module
		echo "Shadow hit shader:"
		slangc $file -entry shadow -o modules/shadow.slang-module

		files="modules/closesthit.slang-module
		modules/anyhit.slang-module
		modules/shadow.slang-module
		$files"
	else
		slangc $file -o modules/$file-module
		list="modules/$file-module $list"
		files="modules/$file-module
		$files"
	fi
done

header "compiling altogether:"

echo "
$files"

echo "Closest hit shader:"
slangc $list modules/closesthit.slang-module -target dxil -entry closesthit -o dxr.dxil
echo "Any hit shader:"
slangc $list modules/anyhit.slang-module -target dxil -entry anyhit -o dxr.dxil
echo "Shadow hit shader:"
slangc $list modules/shadow.slang-module -target dxil -entry shadow -o dxr.dxil

header "monolithic compilation:"

echo ""
echo "Closest hit shader:"
slangc hit.slang -target dxil -entry closesthit -o dxr-monolothic.dxil
echo "Any hit shader:"
slangc hit.slang -target dxil -entry anyhit -o dxr-monolothic.dxil
echo "Shadow hit shader:"
slangc hit.slang -target dxil -entry shadow -o dxr-monolothic.dxil

# read -p "dump spirv-asm? (y/n): " confirm
# if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
# 	spirv-dis dxr.spirv
# 	echo "
# 	# of spirv insts. (approx.): " $(spirv-dis dxr.spirv | wc -l)
# fi
