#! python3
import funcs

if __name__ == "__main__":
    confirmation = input("This will overwrite your existing dotfiles. Are you sure? (y/n): ")
    if confirmation.lower() != 'y':
        print("Operation cancelled.")
        exit(1)

    # Copy dotfiles from the repository to the home directory
    funcs.iterate(lambda dotfilePath, repoPath: funcs.copy(repoPath, dotfilePath))
