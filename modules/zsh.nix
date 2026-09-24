{ config, pkgs, lib, ... }:

{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        
        initContent = lib.mkMerge [
          (lib.mkOrder 550 ''
            fpath=(${config.home.homeDirectory}/.dotfiles/zsh_comps $fpath)
          '')

          (lib.mkOrder 1000 ''
            source ${config.home.homeDirectory}/.dotfiles/config/zsh/.zsh_vim
            source "${config.home.homeDirectory}/.dotfiles/config/zsh/.zshrc"
          '')
        ];
    };

    home.packages = with pkgs; [
        zsh-vi-mode
        zsh-history-substring-search
        fzf
        ripgrep
        fd
    ];
}

