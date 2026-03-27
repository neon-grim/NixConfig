{pkgs, ...}:
{
  environment.systemPackages = with pkgs;
  [
    # Editing
    gimp
    kdePackages.kdenlive
    pinta
    # Media
    celluloid
    lollypop
    eog
    # Office
    onlyoffice-desktopeditors
    mousepad
    # Chromium
    brave
    # Tools
    qbittorrent
  ];
}
