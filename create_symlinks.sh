#!/bin/sh
# Create symlinks in $HOME

function color() {
  ls --color -d "$@"
}

echo Creating symlinks...
args="$@"
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
all_dotdirs=$(find ${script_dir} -maxdepth 1 -type d ! -path '*/\.*' ! -path "$script_dir" | sort)
dotdirs=$(realpath ${args:-${all_dotdirs}})
printf '%s\n' "$(color ${dotdirs})"
for d in $dotdirs; do
    printf "Create symlinks in $(color $HOME) for: $(color $(basename $d))\n"
    files=$(find ${d} -type f)
    pretty_files=$(color $files)
    paste <(printf "%s\n" "${pretty_files[@]/$(dirname $d)/${HOME}}") <(printf "%s\n" "${pretty_files[@]}") | column -t -o " -> "
    read -p "Confirm? " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        for f in $files ; do
            dest="${f/${d}/${HOME}}"
            dir=$(dirname "${dest}")
            pretty_f=$(color $f)
            pretty_dest="${pretty_f/${d}/${HOME}}"
            echo "Symlinking ${pretty_dest} -> $(color $f)"
            mkdir -p ${dir}
            ln -s ${f} ${dest} 2>/dev/null
            if [ $? -ne 0 ]; then
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
