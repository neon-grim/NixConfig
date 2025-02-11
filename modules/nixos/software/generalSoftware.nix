{pkgs, ...}:
{
  environment.systemPackages = with pkgs;
  [
    bottles
    celluloid
    davinci-resolve
    krita
    lollypop
    losslesscut-bin
    moonlight-qt
    pitivi
    python3Full
    resources
    thunderbird
    vipsdisp
    xfce.mousepad
  ];
}
