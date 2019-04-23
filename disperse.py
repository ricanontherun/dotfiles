#! /usr/bin/python
import funcs

funcs.iterate(lambda dotfilePath, repoPath: funcs.copy(repoPath, dotfilePath))
