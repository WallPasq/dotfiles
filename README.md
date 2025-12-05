# How to start

To begin the setup on the MacBook Silicon, run the following commands in the terminal:

```bash
# Install Brew as a package manager
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Configures the next steps for Brew, for ZSH
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$USER/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install the base programs
brew install neovim kitty uv fnm imagemagick ghostscript fzf fd bat tree zoxide stow

# Install Poe the Poet as an add-on for uv
uv tool install poethepoet

# Install the latest version of Node
fnm install --lts

# Nerd font
brew install --cask font-fira-code-nerd-font

# Add all dotfiles
cd ~
git clone -q https://github.com/WallPasq/dotfiles.git
cd dotfiles
stow .
```

