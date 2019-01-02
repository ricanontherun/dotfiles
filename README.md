# Dotfile Manager

Python scripts to help maintain consistent dotfile versions across machines, fork it and make it your own.

1. Update `config.FILE_MAP` with name/path pairs for each dotfile you'd like to manage.
2. Run `python gather.py` to fetch all configured dotfiles, and copy them into `config.REPO_FILES_DIR`.
3. Run `python disperse.py` to copy the repository files to their configured system locations.
