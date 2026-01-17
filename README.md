# Homebrew MacSweep

Homebrew tap for [MacSweep](https://github.com/Viniciuscarvalho/MacSweep) - macOS Disk Space Optimizer.

## Installation

```bash
brew tap viniciuscarvalho/macsweep
brew install macsweep
```

## Usage

```bash
# Scan disk usage
macsweep

# Clean all categories (dry-run preview)
macsweep clean all

# Actually clean (with confirmation)
macsweep clean all --execute

# Interactive mode
macsweep -i

# Schedule daily cleanup
macsweep schedule enable --daily
```

## Updating

```bash
brew update
brew upgrade macsweep
```

## More Information

See the [MacSweep repository](https://github.com/Viniciuscarvalho/MacSweep) for full documentation.
