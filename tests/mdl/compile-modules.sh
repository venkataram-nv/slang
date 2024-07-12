set -e

alias slangc=../../build/Release/bin/slangc

list=""
files=""
for file in *.slang; do
    if [ -f "$file" ]; then
		echo "file: $file"
		slangc $file -o modules/$file-module
		list="modules/$file-module $list"
		files="modules/$file-module
		$files"
	fi
done

echo "
compiling altogether:
		$files"
slangc $list -target spirv -o dxr.spirv

read -p "dump spirv-asm? (y/n): " confirm
if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
	spirv-dis dxr.spirv
	echo "
	# of spirv insts. (approx.): " $(spirv-dis dxr.spirv | wc -l)
fi
