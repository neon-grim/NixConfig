{pkgs, ...}:
{
  environment.systemPackages = with pkgs;
  [
    baobab
    ffmpegthumbnailer
    file-roller
    libnotify
    nemo-with-extensions
    pantheon.pantheon-agent-polkit
    pavucontrol
    pika-backup
    resources
    totem
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