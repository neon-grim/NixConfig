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
    collabora-desktop
    mousepad
    # Chromium
    brave
    # Tools
    qbittorrent
    python315
  ];
}
