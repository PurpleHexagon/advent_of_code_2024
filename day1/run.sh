#!/bin/bash

FILES="input/*"
for input_filename in $FILES
do
    input=`cat $input_filename`
    actual_output=`elixir solution.exs <<< "$input"`

    echo $actual_output
done
