# Dotfiles

Modular, reproducible dotfiles managed via Nix Flakes and Home Manager.

This repository separates Nix system package management from raw configuration files. Using mkOutOfStoreSymlink, configurations in config/ are symlinked directly into $HOME, allowing live-editing of configs without running home-manager switch on every change.

## 🛠 Tech Stack

Terminal: Ghostty (Native host binary, HM-managed config)

Multiplexer: Tmux

Shell: Zsh (zsh-vi-mode, fzf, ripgrep, fd)

Editor: Neovim (lazy.nvim, Treesitter, Mason)

Package Manager: Nix (Flakes + Home Manager)

## 📂 Repository Structure

```bash
~/dotfiles/
├── flake.nix             # Flake entrypoint & multi-profile generator
├── flake.lock            # Locked dependency versions
├── home.nix              # Core Home Manager configuration
├── modules/              # Nix package & environment modules
│   ├── ghostty.nix
│   ├── neovim.nix
│   ├── tmux.nix
│   └── zsh.nix
└── config/               # Raw, live-editable config files
    ├── ghostty/
    │   └── config
    ├── nvim/             # Neovim init.lua & Lua setup
    ├── tmux/
    │   └── .tmux.conf
    └── zsh/
        ├── .zshrc
        └── .zsh_vim
```


## 🚀 Quick Start & Installation

1. Prerequisites

Ensure Nix is installed on your system with Flakes enabled in ~/.config/nix/nix.conf:

```bash
extra-experimental-features = nix-command flakes
```

2. Clone Repository

```bash
git clone https://github.com/mfisher1996/dotfiles.git ~/dotfiles
cd ~/dotfiles
```


3. Apply Home Manager Flake

Apply the profile corresponding to your active system user (masonf for work, mason for home):

```bash
# Automatically match current $USER
home-manager switch --flake .#$USER
```


Or target a specific user explicitly:

```bash
# Work profile
home-manager switch --flake .#masonf

# Home PC profile
home-manager switch --flake .#mason
```


## ⚡ Workflow & Maintenance

### Live Editing

Because configuration files use out-of-store symlinks (mkOutOfStoreSymlink), any modifications made inside ~/dotfiles/config/ take effect immediately in your active environment without needing to re-run home-manager switch.

Adding New Nix Packages

Edit the relevant module file in modules/ (or add a new .nix module), add it to Git, and apply changes:

git add . home-manager switch --flake .#$USER 

### Updating Nix Flake Dependencies

To update locked Nixpkgs and Home Manager dependencies:

```bash
cd ~/dotfiles
nix flake update
home-manager switch --flake .#$USER
```


### Cleaning Up Old Nix Generations

To clear out historic profile builds and reclaim disk space:

```bash
nix-collect-garbage -d
```

