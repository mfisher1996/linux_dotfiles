{ config, pkgs, ... }

{ 
    programs.tmux = {
        enable = true;
    };

    home.file.".tmux.conf".source = config.lib.file.mkOutOfStoreSymlink "${config.home.hoeDirecotry}/dotfiles/config/tmux/.tmux.conf";
}
