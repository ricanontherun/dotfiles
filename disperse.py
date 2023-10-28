#! /usr/bin/python3
import funcs

funcs.iterate(lambda dotfilePath, repoPath: funcs.copy(repoPath, dotfilePath))
