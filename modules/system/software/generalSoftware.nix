{pkgs, ...}:
{ 
  programs.firefox.enable = true;
  environment.systemPackages = with pkgs;
  [
    gimp
    gparted
    libsForQt5.kdenlive
    moonlight-qt
    obs-studio
    onlyoffice-bin_latest
    python3
    rhythmbox
    vlc
    xfce.mousepad
    xfce.orage
    xfce.ristretto
    xfce.xfce4-taskmanager
  ];
}
