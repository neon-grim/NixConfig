{pkgs, ...}:
{
  services.playerctld.enable = true;
  programs.nm-applet.enable = true;
  environment.systemPackages = with pkgs;
  [
    pantheon.pantheon-agent-polkit
    pavucontrol
    wofi
    libnotify
    xdg-user-dirs
    xdg-utils
  ];
  xdg.portal =
  {
    enable = true;
    extraPortals = 
    [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}