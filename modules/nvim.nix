{ config, pkgs, ... }

{ 
    programs.neovim = {
        enable = true;
        defaultEditor = true;
    };

    home.packages = with pkgs; [
        gcc
        gnumake
        cmake
        unzip
        curl
        gnutar
        cargo

        ripgrep
        fd
    ];


    home.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.hoeDirecotry}/dotfiles/config/nvim";
}
