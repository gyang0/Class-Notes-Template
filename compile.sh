#!/bin/bash

# Additive total
total_file_str="% Course Name"$'\n'"% Your Name"$'\n'"% Date"$'\n'

# https://stackoverflow.com/a/43661580
files=`ls ./notes/*.md`
for file in $files
do
    # Current file
    file_str=$(<$file)

    # Replace $$\begin{...} ... \end{...}$$ with \begin{...} ... \end{...}
    # works for gather* and align*
    # VSCode markdown needs the $$, but incompatible with Pandoc.
    file_str="${file_str//\$\$\\begin\{/\\begin\{}"
    file_str="${file_str//\\end\{gather\*\}\$\$/\\end\{gather\*\}}"
    file_str="${file_str//\\end\{align\*\}\$\$/\\end\{align\*\}}"

    # For complete set of notes
    total_file_str+="$file_str"$'\n'$'\n'

    # File name without extension
    # https://stackoverflow.com/questions/965053/extract-filename-and-extension-in-bash
    filename="${file##*/}"
    filename="${filename%.*}"
    
    echo "% Course Name"$'\n'"% Your Name"$'\n'"% Date"$'\n'"$file_str" | pandoc -s -o "output/$filename.pdf" --katex --toc -N -V geometry:"margin=1in" -f markdown-implicit_figures --resource-path=./notes
    echo "$file complete."
done

# All notes combined
echo "Compiling total notes"
echo "$total_file_str" | pandoc -s -o "output/TOTAL.pdf" --katex --toc -N -V geometry:"margin=1in" -f markdown-implicit_figures --resource-path=./notes
