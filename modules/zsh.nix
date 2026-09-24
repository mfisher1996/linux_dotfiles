{ config, pkgs, lib, ... }: # Fix 1: Removed 'programs' from arguments

{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        
        initContent = lib.mkOrder 550 ''
          fpath=(${config.home.homeDirectory}/.dotfiles/zsh_comps $fpath)
        '';

        # Fix 2: Put your raw, static ~/.zshrc content right here
        # Instead of a symlink, read the file directly into Home Manager
        initExtra = ''
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

    # Safe to keep if it doesn't conflict with main shell control
    #home.file.".zsh_vim".source =
      #config.lib.file.mkOutOfStoreSymlink;
}

