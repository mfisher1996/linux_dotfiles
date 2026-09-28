{ config, pkgs, inputs, ... }:
{
    home.stateVersion = "24.05";

    programs.home-manager.enable = true;

    home.packages = with pkgs; [
        ffmpeg
        steam-run
        devenv
        inputs.zen-browser.packages.${pkgs.system}.default
    ];

    home.sessionVariables = {
        MOZ_FFMPEG_LIBRARIES = "${pkgs.ffmpeg}/lib/libavcodec.so";
        LD_LIBRARY_PATH = "${pkgs.ffmpeg}/lib:\${LD_LIBRARY_PATH}";
    };

    imports = [
        ./modules/zsh.nix
        ./modules/tmux.nix
        ./modules/nvim.nix
        ./modules/ghostty.nix
        ./modules/scripts.nix
    ];
}
