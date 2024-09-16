{pkgs, ...}:
{
  services.playerctld.enable = true;
  programs.nm-applet.enable = true;
  environment.systemPackages = with pkgs;
  [
    # WM Tools
    pantheon.pantheon-agent-polkit
    pavucontrol
    wofi
    # Dependencies 
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