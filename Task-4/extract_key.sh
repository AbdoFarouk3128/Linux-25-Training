<<<<<<< Updated upstream
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
=======
#!/bin/bash

if [[ $# -ne 2 ]]; then 
  echo "Usage: $0 <archive1.zip|archive1.tar.xz> <archive2.zip|archive2.tar.xz>"
  exit 1 
fi

out_dir="extracted_files"
mkdir -p "$out_dir"

extract_file(){
  local file="$1"

  if [[ ! -f "$file" ]]; then 
    echo "Error: file not found -> $file"
    exit 1
  fi

  case "$file" in 
    *.zip)
      unzip -q "$file" -d "$out_dir" || { echo "Failed to unzip: $file"; exit 1; }
      ;;
    *.tar.xz)
      tar -xJf "$file" -C "$out_dir" || { echo "Failed to untar: $file"; exit 1; }
      ;;
    *)
      echo "Unsupported file type: $file"
      exit 1
      ;;
  esac
}

extract_file "$1"
extract_file "$2"

echo "Extraction completed successfully into: $out_dir/"
>>>>>>> Stashed changes
