{pkgs, ...}:
{
  environment.systemPackages = with pkgs;
  [
    ffmpegthumbnailer
    libnotify
    nemo-with-extensions
    pantheon.pantheon-agent-polkit
    pavucontrol
    resources
    swaybg
    wofi
    xdg-utils
  ];
  programs =
  {
    file-roller.enable = true;
    gnome-disks.enable = true;
    nm-applet.enable = true;
  };
  services.playerctld =
  {
    enable = true;
  };
}