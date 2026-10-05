{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    autosuggestion.enable = true;
    historySubstringSearch.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "af-magic";
    };

    plugins = [
      {
        name = "fast-syntax-highlighting";
        src = "${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions";
      }
    ];

    initContent = lib.mkMerge [
      (lib.mkOrder 550 ''
        fpath=(${config.home.homeDirectory}/.dotfiles/zsh_comps $fpath)
      '')

      (lib.mkOrder 1000 ''
        source ${config.home.homeDirectory}/.dotfiles/config/zsh/.zsh_vim
        source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
      '')
    ];
  };

  home.packages = with pkgs; [
    fzf
    ripgrep
    fd
  ];
}
