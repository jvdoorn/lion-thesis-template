# Always compile to .pdf
$pdf_mode = 1;
# Define our main file
@default_files = ('thesis.tex');

# Configure pdf compilation to use lualatex
$pdflatex = 'lualatex -shell-escape';
