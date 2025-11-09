{pkgs, ...}:
{
  environment.systemPackages = with pkgs;
  [
    # backups
    pika-backup
    # Wine
    bottles
    # Streaming
    gpu-screen-recorder-gtk
    moonlight-qt
    # Editing
    gimp
    kdePackages.kdenlive
    pinta
    pitivi
    # Media
    gapless
    lollypop
    totem
    vlc
    image-roll
    # Office
    onlyoffice-desktopeditors
    xfce.mousepad
    # Chromium
    brave
    teams-for-linux
    vesktop
    # Tools
    resources
  ];
  programs =
  {
    gpu-screen-recorder =
    {
      enable = true;
    };
  };
}
