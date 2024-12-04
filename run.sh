#!/bin/bash

# Check if directory name is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

DIRNAME=$1
FILES="$DIRNAME/input/*"

for input_filename in $FILES
do
    input=$(cat "$input_filename")
    actual_output=$(elixir "$DIRNAME/solution.exs" <<< "$input")

    echo "$actual_output"
done

