{ config, pkgs, ... }:
{
    home.file.".local/scripts/new_project".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/scripts/new_project";
}
