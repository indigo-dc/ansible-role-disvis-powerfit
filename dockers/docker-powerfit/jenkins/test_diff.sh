#!/bin/bash

display_usage() {
    echo "This script compare two sets of output files (plain text) and output differences if any"
    echo -e "\nUsage:\n$0 /path/to/reference/files/ /path/to/results/files\n"
}

if [[ $# -ne 2 ]]
then
    display_usage
    exit 1
fi

if [[ ( $# == "--help") ||  $# == "-h" ]]
then
    display_usage
    exit 0
fi

ref_dir=$1
res_dir=$2

for i in `ls $ref_dir/* | grep ".out\|.pdb"`
do
    filename=`basename $i`
    nb_diff=`diff $i $res_dir/$filename | wc -l`
    if [[ $nb_diff -ne 0 ]]
    then
        echo "File '$filename' is different from the reference"
    fi
done
