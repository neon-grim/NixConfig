{pkgs, ...}:
{
  programs =
  {
    dconf.enable = true;
  };
  environment.systemPackages = with pkgs;
  [
    bottles
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
