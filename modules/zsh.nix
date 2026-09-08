# ~/dotfiles/modules/zsh.nix
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    zsh
    zsh-vi-mode
    fzf
    ripgrep
    fd
  ];

  home.file.".zshrc".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/zsh/.zshrc";
  home.file.".zsh_vim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/zsh/.zsh_vim";
}
