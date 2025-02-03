{pkgs, ...}:
{
  environment.systemPackages = with pkgs;
  [
    bottles
    celluloid
    krita
    lollypop
    moonlight-qt
    pitivi
    python3Full
    resources
    thunderbird
    vipsdisp
    xfce.mousepad
  ];
}
