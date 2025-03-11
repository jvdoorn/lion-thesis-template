# Thesis template for B.Sc. and M.Sc. students at Leiden Institute of Physics (LION)
Originally created by [Michiel de Dood](https://github.com/mdedood/lion-msc), updated by me to be a bit more modern and to include a few more features. The refactored version of the template is based on what I found useful whilst writing my own theses. Below you can find an overview features and usage instructions.

Contrary to the original design, this repository has been set up as a template repository instead of publishing the package to CTAN. This way, you can easily obtain the latest version of the template without having to update your LaTeX distribution. To start writing your thesis press the [use this template](https://github.com/new?template_name=lion-thesis-template&template_owner=jvdoorn) button.

## Features
- Modernized class that works with recent versions of commonly used packages;
- Preconfigured `latexmk` for easy compilation;
- Preconfigured commonly used packages such as `siunitx`, `mhchem` and `booktabs` (see `preamble.tex`);
- Clear directory structure for easy organization of your thesis;
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

### Finishing your thesis
When you are finished we recommend the following:
- Replace the contents of this `README.md` with your abstract and link to your thesis on the university website;
- Mark your repository as public on GitHub, only if you want to share your thesis with others;

### GitHub actions
When pushing your changes to the `main` branch, GitHub actions will automatically increment the version number and create a new git tag. Additionally, it will automatically compile your thesis and create a release. You can then easily download and view the release on GitHub.

We use the following versioning scheme: `v<major>.<minor>.<patch>`.  Generally, we suggest using the following:
- Increment major when you finish your thesis (will result in `v1.0.0`);
- Increment minor when you add a new chapter or section;
- Increment patch when you make minor changes to the document.

By default, GitHub actions will increment the patch version number, you can control this behaviour by including `[major]`, `[minor]` or `[patch]` in the commit message. If you want to skip the compilation, include `[skip ci]` in the commit message. If you do not want to use actions you can disable them in by going to `Settings > Actions > General` on GitHub.
