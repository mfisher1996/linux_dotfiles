{ config, pkgs, ... }:
{ 
	home.sessionVariables = {
		EDITOR = "nvim";
		VISUAL = "nvim";
	};


    home.packages = with pkgs; [
    	neovim
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


    xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/nvim";
}
