{pkgs, ...}:
{
  environment.systemPackages = with pkgs;
  [
    ffmpegthumbnailer
    libnotify
    nemo-with-extensions
    pantheon.pantheon-agent-polkit
    pavucontrol
    wofi
    xdg-user-dirs
    xdg-utils
  ];
  programs =
  {
    dconf.enable = true;
    file-roller.enable = true;
    gnome-disks.enable = true;
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