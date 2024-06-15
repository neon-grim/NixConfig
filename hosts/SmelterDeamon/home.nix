{config, pkgs, username, ...}:
{
  imports = 
  [
    ./../../modules/homeManager/default.nix
    {}
  ];
  # home manager user info
  home.username = username;
  home.homeDirectory = "/home/${username}";
  # home manager install verison
  home.stateVersion = "23.11";
  # let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
