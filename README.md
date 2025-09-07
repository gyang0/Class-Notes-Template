# Class Notes
## TL;DR
**Requires <a href="https://pandoc.org/" target="_blank">Pandoc</a> for the Markdown -> LaTeX conversion.**

1. Add markdown notes in `/notes` (and all images)
2. `bash compile.sh`
3. Get LaTeX PDFs in `/output`

## Info
- The specific command is `echo [FILE_CONTENTS] | pandoc -s -o "output/$filename.pdf" --katex --toc -N -V geometry:"margin=1in" -f markdown-implicit_figures --resource-path=./notes`
    - Replace `--resource-path=./notes` with your path to images.
- VSCode Markdown allows `$$\begin{}...\end{}$$`, but this throws errors with Pandoc. Those are manually replaced with `\begin{}...\end{}` for the gather\* and align\* environments. Add more as required. Probably a way to do this with regex, but can't be bothered.
