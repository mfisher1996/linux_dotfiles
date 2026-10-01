{ config, pkgs, inputs, ... }:

let
  zen-browser-wrapped = pkgs.symlinkJoin {
    name = "zen-browser";
    paths = [ inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default ];
    nativeBuildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/zen \
        --prefix LD_LIBRARY_PATH : "${pkgs.ffmpeg.lib}/lib"
    '';
  };
in
{
  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    ffmpeg
    devenv
    zen-browser-wrapped
    pkgs.bruno
  ];

  imports = [
    ./modules/zsh.nix
    ./modules/tmux.nix
    ./modules/nvim.nix
    ./modules/ghostty.nix
    ./modules/scripts.nix
  ];
}
