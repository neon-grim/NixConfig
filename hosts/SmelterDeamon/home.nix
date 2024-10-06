{config, pkgs, user, compositor, ...}:
{
  imports = 
  [
    ./../../modules/homeManager/default.nix
    ./../../modules/homeManager/${compositor}.nix
  ];
  home.username = "${user}";
  home.homeDirectory = "/home/${user}";
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
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
