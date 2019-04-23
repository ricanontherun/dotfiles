from os import path, makedirs
from errno import EEXIST
from shutil import copyfile

import config

def iterate(callback):
    """
    Interate over config keys, executing callback on each entry.
    """
    for key in config.FILE_MAP:
        repofile = config.REPO_FILES_DIR + key
        dotfile = path.expanduser(config.FILE_MAP[key])

        try:
            callback(dotfile, repofile)
        except Exception as e:
            print("Error: {}".format(str(e)))

    print("Fin.")

def copy(copyFrom, copyTo):
    """
    Copy a file from one source to another.
    """
    # Create any parent directories as necessary
    dirname = path.dirname(copyTo)
    if not path.exists(dirname):
        try:
            makedirs(dirname)
        except OSError as e:
            # Race condition guard.
            if e.errno != EEXIST:
                print("Failed to makedirs: {}".format(str(e)))

    print("Copying {} to {}".format(copyFrom, copyTo))
    copyfile(copyFrom, copyTo)
