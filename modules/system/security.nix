{pkgs, ...}:
{
  security.polkit.enable = true;
  security.rtkit.enable = true;
  environment.systemPackages = with pkgs;
  [
    pantheon.pantheon-agent-polkit
  ];
}
