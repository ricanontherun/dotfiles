from os import path, makedirs
from errno import EEXIST
from shutil import copyfile
import subprocess
from pathlib import Path

import config

def shell_home_dir() -> str:
    """
    Attempt to resolve the current user's homedir.
    """
    [exit_code, output] = subprocess.getstatusoutput('realpath ~')
    return output if exit_code == 0 else Path.home()

def iterate(callback):
    """
    Iterate over config keys, executing callback on each entry.
    """
    for key in config.FILE_MAP:
        repofile = config.REPO_FILES_DIR + key
        dotfile = path.expanduser(config.FILE_MAP[key])

        try:
            callback(dotfile, repofile)
        except Exception as e:
            print("Error: {}".format(str(e)))

    print("Fin.")

def copy(copy_from, copy_to):
    """
    Copy a file from one source to another.
    """
    # Create any missing parent directories
    dirname = path.dirname(copy_to)
    if not path.exists(dirname):
        try:
            makedirs(dirname)
        except OSError as e:
            # Race condition guard.
            if e.errno != EEXIST:
                print("Failed to makedirs: {}".format(str(e)))

    copyfile(copy_from, copy_to)
