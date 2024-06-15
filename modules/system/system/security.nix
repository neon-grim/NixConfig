{pkgs, ...}:
{
  security =
  {
    polkit.enable = true;
    rtkit.enable = true;
  };
  environment.systemPackages = with pkgs;
  [
    pantheon.pantheon-agent-polkit
  ];
}
