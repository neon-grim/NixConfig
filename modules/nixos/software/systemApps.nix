{pkgs-stable, ...}:
{
  environment.systemPackages = with pkgs-stable;
  [
    # Streaming
    moonlight-qt
    # Editing
    gimp
    kdePackages.kdenlive
    pinta
    # Media
    lollypop
    vlc
    image-roll
    # Office
    onlyoffice-desktopeditors
    xfce.mousepad
    # Chromium
    brave
    teams-for-linux
    # Tools
    qbittorrent
    bottles
  ];
}
