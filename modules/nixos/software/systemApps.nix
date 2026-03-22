{pkgs, ...}:
{
  environment.systemPackages = with pkgs;
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
    mousepad
    # Chromium
    brave
    # Tools
    qbittorrent
    bottles
  ];
}
