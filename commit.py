#! /usr/bin/python

import funcs

def main():
    # Copy everytrhing from system to repo.
    funcs.iterate(lambda dotfilePath, repoPath: funcs.copy(dotfilePath, repoPath))

if __name__ == "__main__":
    main()
