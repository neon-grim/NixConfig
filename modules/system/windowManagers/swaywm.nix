{pkgs, ...}:
{
  programs =
  {
    dconf.enable = true;
    sway =
    {
      enable = true;
      wrapperFeatures.gtk = true;
    };
  };
  environment.systemPackages = with pkgs;
  [
    # Temp
    foot
    # Waybar Tools
    swww
    wayshot
    # WM Tools
    networkmanagerapplet
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
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}