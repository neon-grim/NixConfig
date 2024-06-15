{pkgs, ...}:
{
  programs =
  {
    dconf.enable = true;
    hyprland.enable = true;
  };
  environment.systemPackages = with pkgs;
  [
    # Hyprland Tools
    hyprland-workspaces
    hyprland-protocols
    hyprnome
    hyprpaper
    hyprshot
    # WM Tools
    networkmanagerapplet
    pavucontrol
    swaynotificationcenter
    waybar
    wlogout
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