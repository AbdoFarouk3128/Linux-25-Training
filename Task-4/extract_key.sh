#!/bin/bash


if [[ $# -ne 2 ]] ; then
    echo "Usage: $0 <archive1> <archive2>"
    exit 1
fi

file1=$1
file2=$2
outdir="extracted_files"
mkdir -p "$outdir"

if [[ $file1 == *.zip ]] ; then
    unzip -q "$file1" -d "$outdir"
elif [[ $file1 == *.tar.xz ]]; then 
    tar -xJf "$file1" -C "$outdir"
else 
    echo "unsupported file type: $file1"
fi


if [[ $file2 == *.zip ]] ; then
    unzip -q "$file2" -d "$outdir"
elif [[ $file2 == *.tar.xz ]]; then 
    tar -xJf "$file2" -C "$outdir"
else 
    echo "unsupported file type: $file2"
fi

echo "Extraction complete.Files are in '$outdir/'"
