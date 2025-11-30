{pkgs, ...}:
{
  environment.systemPackages = with pkgs;
  [
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
    proton-pass
    xfce.mousepad
    # Chromium
    brave
    teams-for-linux
    vesktop
    # Tools
    baobab
    bottles
    pika-backup
  ];
  programs =
  {
    gpu-screen-recorder =
    {
      enable = true;
    };
  };
}
