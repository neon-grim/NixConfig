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
    stateVersion = "23.11";
  };
}