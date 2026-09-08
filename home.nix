{ config, pkgs, ... }:
{
    home.stateVersion = "24.05";

    programs.home-manager.enable = true;

    imports = [
        ./modules/zsh.nix
        ./modules/tmux.nix
        ./modules/nvim.nix
        ./modules/ghostty.nix
    ];
}
