{ config, pkgs, ... }

{ 

    home.packages = with pkgs; [
        ghostty
    ];

    xdg.configFile."ghosty/config".source = config.lib.file.mkOutOfStoreSymlink "${config.home.hoeDirecotry}/dotfiles/config/ghostty/config";
}
