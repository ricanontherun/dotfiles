import funcs

if __name__ == "__main__":
    funcs.iterate(lambda dotfilePath, repoPath: funcs.copy(dotfilePath, repoPath))
