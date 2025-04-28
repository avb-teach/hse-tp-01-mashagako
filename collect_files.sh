#!/bin/bash
input_dir="$1"
output_dir="$2"
all_files=$(find "$input_dir" -type f)

for file in $all_files; do
filename=$(basename "$file")

copy () {
	local dir="$1"
	for file in "$dir"/*; do
	if [-d "$file"]; then
		copy "$file"
	elif [ -f "$file" ]; then
		local filename=$(basename "$file")
		local file2="$output_dir/$filename"
		local k=1

		while [-e "$file2" ]; do
OA			file2="$output_dir/${filename%.*}_$k.${filename##*.}"
			((k++))
		done
		cp "$file" "$file2"
	fi
done
