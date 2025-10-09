#!/bin/bash

export LD_LIBRARY_PATH=${PWD}

declare -a array=(
    "mult_seq_dep_32_bgv_logN15"
    "mult_seq_indep_32_bgv_logN15"
    "mult_seq_dep_32_bfv_logN15"
    "mult_seq_indep_32_bfv_logN15"
)

# get index from input argument
INDEX=$1
if [ -n "$INDEX" ]; then
    if [ "$INDEX" -ge 0 ] && [ "$INDEX" -lt "${#array[@]}" ]; then
        name=${array[$INDEX]}
        for n in {0..9}; do
            ./${name} 1000 "${name}.${n}" &
        done
        exit 0
    else
        echo "Index out of range. Please provide an index between 0 and $((${#array[@]} - 1))."
        exit 1
    fi
fi
