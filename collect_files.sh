#!/bin/bash
input_dir="$1"
output_dir="$2"

find "$input_dir" -type f -exec cp {} "$output_dir" \;

find "$input_dir" -type f -print0 | while IFS= read -r -d $'\0' file; do
	filename=$(basename "$file")
	dirname=$(dirname "$file")
	main=""
	extension=""
	
	if [[ "$filename" == *"."* ]]; then
		main="${filename%.*]"
		extension=".${filename##.}"
	else
		main="$filename"
	fi
	((k["$filename"]++))
	if ((k["$filename"] > 1)); then
		new="${main}_${k["$filename"]}${extension}"
		mv "$file" "$dirname/$new"
	fi
done
