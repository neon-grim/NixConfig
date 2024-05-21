{ config, pkgs, ... }:
{
  imports = 
  [
    ./../../modules/homeManager/default.nix
  ];
  # home manager user info
  home.username = "ashen_one";
  home.homeDirectory = "/home/ashen_one";
  # home manager install verison
  home.stateVersion = "23.11"; # Please read the comment before changing.
  # home manager packages
  home.packages = [ ];
  # Manual dotfiles
  home.file = { };
  # home manager seesion variable
  home.sessionVariables = { };
  # let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  # Create XDG Dirs
  xdg = 
  {
    userDirs = 
    {
       enable = true;
       createDirectories = true;
    };
  };
}
