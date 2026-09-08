{ config, pkgs, ... }

{ 
    programs.zsh = {
        enable = true;
    };

    home.file.".zshrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.hoeDirecotry}/dotfiles/config/zsh/.zshrc";
    home.file.".zsh_vim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.hoeDirecotry}/dotfiles/config/zsh/.zsh_vim";

    home.packages = with pkgs; [
        zsh-vi-mode
        fzf
        ripgrep
        fd
    ];
}
