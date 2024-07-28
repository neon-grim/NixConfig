{pkgs, ...}:
{
  programs =
  {
    dconf.enable = true;
  };
  environment.systemPackages = with pkgs;
  [
    gimp
    gparted
    librewolf
    libsForQt5.kdenlive
    moonlight-qt
    obs-studio
    onlyoffice-bin_latest
    python3Full
    rhythmbox
    vlc
    xfce.mousepad
    xfce.orage
    xfce.ristretto
    xfce.xfce4-taskmanager
  ];
}
