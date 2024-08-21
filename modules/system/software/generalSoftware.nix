{pkgs, ...}:
{
  programs =
  {
    dconf.enable = true;
  };
  environment.systemPackages = with pkgs;
  [
    krita
    librewolf
    moonlight-qt
    obs-studio
    onlyoffice-bin_latest
    pitivi
    python3Full
    rhythmbox
    vlc
    xfce.mousepad
    xfce.orage
    xfce.ristretto
    xfce.xfce4-taskmanager
  ];
}
