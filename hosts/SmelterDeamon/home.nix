{config, pkgs, username, windowManager, ...}:
{
  imports = 
  [
    ./../../modules/homeManager/default.nix
    ./../../modules/homeManager/${windowManager}.nix
  ];
  # home manager user info
  home.username = username;
  home.homeDirectory = "/home/${username}";
  # home manager install verison
  home.stateVersion = "23.11";
  # let home manager install and manage itself.
  programs.home-manager.enable = true;
  # User dirs
  xdg = 
  {
    enable = true;
    userDirs = 
    {
      enable = true;
      createDirectories = true;
    };
  };
}
