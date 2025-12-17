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
    vesktop
    # Tools
    qbittorrent
    bottles
    # SDKs
    python314
  ];
  programs =
  {
    gpu-screen-recorder =
    {
      enable = true;
    };
  };
}
