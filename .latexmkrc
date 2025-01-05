$pdf_mode = 1; # tex -> pdf
@default_files = ('thesis.tex');

$pdflatex = 'lualatex -shell-escape -latexoption=-file-line-error -f';
$lualatex = 'lualatex -shell-escape -latexoption=-file-line-error -f';
