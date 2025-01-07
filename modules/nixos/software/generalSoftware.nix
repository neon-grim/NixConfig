{pkgs, ...}:
{
  environment.systemPackages = with pkgs;
  [
    celluloid
    krita
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
