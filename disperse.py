import funcs
import config
from os import path

if __name__ == "__main__":
    home_dir = funcs.shell_home_dir()
    confirmation = input(f"This will overwrite the existing dotfiles in {home_dir}. Are you sure? (yes/no): ")
    if confirmation != 'yes':
        print("Operation cancelled, please use 'yes' or 'no'")
        exit(1)
        
    for repo_file, system_file in config.FILE_MAP.items():
        source_path = path.join('.', config.REPO_FILES_DIR, repo_file)
        destination_path = path.join(home_dir, system_file)

        print(f"copying {source_path} to {destination_path}")

        funcs.copy(source_path, destination_path)

    print('fin.')