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
    vlc
    image-roll
    # Office
    libreoffice
    xfce.mousepad
    # Chromium
    brave
    teams-for-linux
    vesktop
    # Benchmarks
    resources
    unigine-heaven
    unigine-valley
  ];
  programs =
  {
    gpu-screen-recorder =
    {
      enable = true;
    };
  };
}
