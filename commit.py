import funcs
import config
from os import path

if __name__ == "__main__":
    home_dir = funcs.shell_home_dir()

    for repo_file, system_file in config.FILE_MAP.items():
        repo_path = path.join('.', config.REPO_FILES_DIR, repo_file)
        dotfile_path = path.join(home_dir, system_file)

        print(f"copying {dotfile_path} to {repo_path}")

        funcs.copy(dotfile_path, repo_path)

    print('fin.')