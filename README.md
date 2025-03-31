# macOS Setup Automation

A simple bash-based automation tool for setting up a new macOS system with your preferred applications and configurations.

## Prerequisites

- macOS
- Internet connection
- Admin privileges (for some installations)

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
   ```

## Usage

### Basic Usage

To run all installation scripts:

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