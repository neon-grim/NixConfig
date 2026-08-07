{user, ...}:
{
  programs.home-manager =
  {
    enable = true;
  };
  home =
  {
    username = "${user}";
    homeDirectory = "/home/${user}";
    stateVersion = "26.05";
  };
}