# Thesis template for B.Sc. and M.Sc. students at Leiden Institute of Physics (LION)
Originally created by [Michiel de Dood](https://github.com/mdedood/lion-msc), updated by me to be a bit more modern and to include a few more features. The refactored version of the template is based on what I found useful whilst writing my own theses. Below you can find an overview features and usage instructions.

Contrary to the original design, this repository has been set up as a template repository instead of publishing the package to CTAN. This way, you can easily obtain the latest version of the template without having to update your LaTeX distribution. To start writing your thesis press the [use this template](https://github.com/new?template_name=lion-thesis-template&template_owner=jvdoorn) button.

## Features
- Modernized class that works with recent versions of commonly used packages.
- Preconfigured `latexmk` for easy compilation.
- Preconfigured commonly used packages such as `siunitx`, `mhchem` and `booktabs` (see `preamble.tex`).
- Clear directory structure for easy organization of your thesis.
- Label the version of your thesis based on the git tag.

## Usage
We recommend compiling using `latexmk`. This will automatically compile the document using `lualatex` and `biber`. The configuration of `latexmk` is stored in the `.latexmkrc` file. To compile the document, simply run `latexmk` in the root of the project.

### Update files based on template (this repository)
To update your thesis based on the template, you can use the following commands:
```bash
# Add the template repository as a remote
git remote add template https://github.com/jvdoorn/lion-thesis-template.git
# Fetch the latest changes from the template repository
git fetch template
# Merge the latest changes from the template repository into your local branch
git merge template/main --allow-unrelated-histories
```
Then go through the conflicting files and resolve any conflicts that may arise. After resolving the conflicts, commit the changes and push them to your repository.
