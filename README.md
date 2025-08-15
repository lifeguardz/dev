# macOS Setup Automation

A simple bash-based automation tool for setting up a new macOS system with my preferred applications and configurations.

## Prerequisites

- macOS
- Internet connection
- Admin privileges (for some installations)
- Homebrew
  - ```bash
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```

## Initial Setup

If this is your first time setting up your macOS environment using this repository, follow these steps **AFTER** you used `RUN`:

1. Initialize git-crypt (only necessary if setting up git-crypt for the first time):
   ```bash
   git-crypt init
   ```

2. Export the git-crypt key:
   Before doing anything else, run the following command to export your git-crypt key:
   ```bash
   git-crypt export-key ../git-crypt-key
   ```

   Store this key somewhere safe, such as in a Bitwarden vault or another secure location.

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/lifeguardz/dev.git
   cd dev
   ```

2. Make sure the scripts are executable:
   ```bash
   chmod +x run
   chmod +x runs/*
   chmod +x dev-env
   ```

## Usage

### Run

To execute all installation scripts, which includes the installation of git-crypt:

```bash
./run
```

### Using Filters

You can specify a filter to run only specific scripts. The filter is a string that will be matched against the script paths:

```bash
./run zsh       # Run only the zsh script
./run neovim    # Run only the neovim script
./run m         # Run all scripts with 'm' in their path (e.g., messengers, microsoft, minstaller)
```

### Dry Run Mode

To see what would be installed without actually making any changes, use the `--dry` flag:

```bash
./run --dry             # Preview all installations
./run --dry neovim      # Preview only neovim installation
```

In dry run mode, the script will output what actions would be taken, prefixed with `[DRY_RUN]`.

### Development Environment Setup

Once the `run` script has been successfully executed, and git-crypt is installed, you can unlock encrypted files and set up your development environment:

To set up the development environment, use the `dev-env` script:

1. Unlock encrypted files using git-crypt:
   ```bash
   git-crypt unlock
   ```

2. Execute the `dev-env` script:
   ```bash
   ./dev-env
   ```

#### Copying Directories and Files

The script uses several functions for setting up your environment:

- **copy_directories_with_contents()**: This function copies entire directories from the source to the destination,
  including all files within each directory **but** not the files that are in the root of the directory. 

- **copy_top_level_files()**: This function copies only the top-level files from the source directory to the destination
  directory, ensuring that only files directly within the specified directory are copied.

- **copy_file()**: A utility function used to copy individual files, possibly replacing the file at the destination.

#### Dry Run Mode for dev-env

As with `run`, you can use the `--dry` mode to preview the copying actions:

```bash
./dev-env --dry         # Preview all copying actions
```

The `dev-env` script will copy your configuration and environment files, ensuring existing files are removed and replaced by new ones. Make sure `run` is fully completed first before setting up the development environment.

## Acknowledgments


Thank you to [ThePrimeagen](https://github.com/ThePrimeagen/dev) for inspiring this setup with a simple bash-based approach instead of Ansible (or other configuration management tools) for a blazing fast setup.
