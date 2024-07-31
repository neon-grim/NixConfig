{pkgs, ...}:
{
  environment.systemPackages = with pkgs;
  [
    # WM Tools
    networkmanagerapplet
    pantheon.pantheon-agent-polkit
    pavucontrol
    swaynotificationcenter
    waybar
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
      #pkgs.xdg-desktop-portal-gtk
    ];
  };
}