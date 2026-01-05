{pkgs-stable, ...}:
{
  environment.systemPackages = with pkgs-stable;
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
  ];
  programs =
  {
    gpu-screen-recorder =
    {
      enable = true;
      package = pkgs-stable.gpu-screen-recorder;
    };
  };
}
