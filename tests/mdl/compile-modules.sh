set -e

alias slangc=../../build/Release/bin/slangc

list=""
files=""
for file in *.slang; do
    if [ -f "$file" ]; then
		echo "file: $file"
		time slangc $file -o modules/$file-module
		list="modules/$file-module $list"
		files="modules/$file-module
$files"
	fi
done

echo "
compiling altogether:

$files"
# time slangc $list -target spirv -o dxr.spirv
time slangc $list -target dxil -o dxr.dxil

echo "
monolithic compilation:"
time slangc hit.slang -target dxil -o dxr-monolothic.dxil

read -p "dump spirv-asm? (y/n): " confirm
if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
	spirv-dis dxr.spirv
	echo "
	# of spirv insts. (approx.): " $(spirv-dis dxr.spirv | wc -l)
fi
