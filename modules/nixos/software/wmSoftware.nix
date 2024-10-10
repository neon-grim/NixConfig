{pkgs, ...}:
{
  environment.systemPackages = with pkgs;
  [
    pantheon.pantheon-agent-polkit
    pavucontrol
    wofi
    libnotify
    xdg-user-dirs
    xdg-utils
  ];
  programs =
  {
    nm-applet.enable = true;
    dconf.enable = true;
  };
  services.playerctld =
  {
    enable = true;
  };
  xdg.portal =
  {
    enable = true;
    extraPortals = 
    [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}