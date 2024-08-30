{pkgs, ...}:
{
  programs =
  {
    dconf.enable = true;
  };
  environment.systemPackages = with pkgs;
  [
    geany
    krita
    librewolf
    moonlight-qt
    obs-studio
    onlyoffice-bin_latest
    pitivi
    python3Full
    resources
    lollypop
    unrar
    celluloid
    xfce.mousepad
    xfce.orage
    xfce.ristretto
  ];
}
