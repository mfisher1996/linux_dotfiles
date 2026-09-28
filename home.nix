{ config, pkgs, inputs, ... }:
{
    home.stateVersion = "24.05";

    programs.home-manager.enable = true;

    home.packages = with pkgs; [
        devenv
        inputs.zen-browser.packages.${pkgs.system}.default
    ];

  home.file.".mozilla/native-messaging-hosts/firenvim.json".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.mozilla/native-messaging-hosts/firenvim.json";

    imports = [
        ./modules/zsh.nix
        ./modules/tmux.nix
        ./modules/nvim.nix
        ./modules/ghostty.nix
        ./modules/scripts.nix
    ];
}
