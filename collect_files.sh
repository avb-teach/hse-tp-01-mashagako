#!/bin/bash
input_dir="$1"
output_dir="$2"

all_files=$(find "$input_dir" -type f)
for file in "all_files"; do
	filename=$(basename "$file")
