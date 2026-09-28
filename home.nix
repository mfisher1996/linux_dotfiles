{ config, pkgs, inputs, ... }:
{
    home.stateVersion = "24.05";

    programs.home-manager.enable = true;

    home.packages = with pkgs; [
        devenv
        inputs.zen-browser.packages.${pkgs.system}.default
    ];

    imports = [
        ./modules/zsh.nix
        ./modules/tmux.nix
        ./modules/nvim.nix
        ./modules/ghostty.nix
        ./modules/scripts.nix
    ];
}
