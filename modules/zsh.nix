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
      {
        name = "zsh-vi-mode";
        src = "${pkgs.zsh-vi-mode}/share/zsh-vi-mode";
      }
    ];

    initExtraBeforeCompInit = ''
      fpath=(${config.home.homeDirectory}/.dotfiles/zsh_comps $fpath)
    '';

    initExtra = ''
      source ${config.home.homeDirectory}/.dotfiles/config/zsh/.zsh_vim
    '';
  };

  home.packages = with pkgs; [
    fzf
    ripgrep
    fd
  ];
}
