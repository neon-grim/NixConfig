{pkgs, ...}:
{
  environment.systemPackages = with pkgs;
  [
    ffmpegthumbnailer
    file-roller
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
    gnome-disks.enable = true;
    nm-applet.enable = true;
  };
  services.playerctld =
  {
    enable = true;
  };
}