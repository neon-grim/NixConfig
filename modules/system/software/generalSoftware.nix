{pkgs, ...}:
{
  programs =
  {
    dconf.enable = true;
  };
  environment.systemPackages = with pkgs;
  [
    celluloid
    krita
    librewolf
    lollypop
    moonlight-qt
    obs-studio
    pitivi
    python3Full
    resources
    thunderbird
    vipsdisp
    xfce.mousepad
  ];
}
