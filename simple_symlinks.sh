#!/bin/bash
# Create symlinks in $HOME

echo Creating symlinks...
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
dotdirs=$(find ${script_dir} -maxdepth 1 -type d ! -path '*/\.*' ! -path "$script_dir")
#echo $script_dir
echo $dotdirs
for d in $dotdirs ; do
    printf "Create symlinks in $HOME for: $(basename $d)\n"
    read -p "Confirm? " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        #stow $d --verbose=2 --no-folding -d $script_dir --target $HOME
        files=$(find ${d} -type f)
        for f in $files ; do
            rel=${f#${d}}
            dest=${HOME}${rel}
            dir=$(dirname "${dest}")
            #echo Symlinking $(basename $f)
            echo ${dest}
            mkdir -p ${dir}
            ln -s ${f} ${dest} 2>/dev/null
            if $!; then
                actual=$(readlink -f -- ${dest} 2>/dev/null || realpath ${dest})
                if [ "${actual}" = ${f} ]; then
					echo Already linked
				else
					read -p "File exists, overwrite? " -n 1 -r
					echo
					if [[ $REPLY =~ ^[Yy]$ ]]; then
						ln -sf ${f} ${dest}
					fi
                fi
            fi
        done
    fi
    echo
done
