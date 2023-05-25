#!/bin/sh
echo -ne '\033c\033]0;ProyectoX\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/ProyectoX.x86_32" "$@"
