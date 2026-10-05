{ config, pkgs, lib, ... }:

{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        oh-my-zsh = {
            enable = true;
            plugins = [ "git"];
            theme = "af-magic";
        };
        autosuggestion.enable = true;
        historySubstringSearch.enable = true;

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
        fzf
        ripgrep
        fd
    ];
}

