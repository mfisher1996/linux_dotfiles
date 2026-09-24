{ config, pkgs, ... }:
{
    #home.file.".local/scripts/new_project".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/scripts/new_project";
    home.file.".local/scripts/new_project" = {
        source = ../scripts/new_project;
        executable =true;
    };
    home.file.".local/scripts/tmux-sessionizer" = {
        source = ../scripts/tmux-sessionizer;
        executable =true;
    };
    home.file.".local/scripts/jump.sh" = {
        source = ../scripts/jump.sh;
        executable =true;
    };
    home.sessionPath = [ "${config.home.homeDirectory}/.local/scripts" ];
}
