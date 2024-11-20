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
    dconf.enable = true;
    nm-applet.enable = true;
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