{ config, pkgs, lib, ... }:

{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        
        # Consolidate all script hooks into the modern initContent pattern
        initContent = ''
          # 1. Inject fpath early (equivalent to order 550 / BeforeCompInit)
          ${lib.mkOrder 550 "fpath=(${config.home.homeDirectory}/.dotfiles/zsh_comps $fpath)"}

          # 2. Main runtime initialization sources (equivalent to initExtra)
          source ${config.home.homeDirectory}/.dotfiles/config/zsh/.zsh_vim
          source "${config.home.homeDirectory}/.dotfiles/config/zsh/.zshrc"
        '';
    };

    home.packages = with pkgs; [
        zsh-vi-mode
        zsh-history-substring-search
        fzf
        ripgrep
        fd
    ];
}
