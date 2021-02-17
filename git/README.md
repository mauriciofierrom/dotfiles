To use a global gitignore:

```bash
git config --global core.excludesFile '~/.gitignore'
```

To set a template with common hooks. Currently used to generate tags depending
on the project type on clone, commit and rebase:

```bash
git config --global init.templatedir '~/.git-templates'
```
