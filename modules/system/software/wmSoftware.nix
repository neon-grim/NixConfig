{pkgs, ...}:
{
  programs.waybar.enable = true;
  environment.systemPackages = with pkgs;
  [
    # WM Tools
    networkmanagerapplet
    pantheon.pantheon-agent-polkit
    pavucontrol
    swaynotificationcenter
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