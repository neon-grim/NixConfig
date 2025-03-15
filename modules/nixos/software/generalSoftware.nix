{pkgs, ...}:
{
  environment.systemPackages = with pkgs;
  [
    bottles
    celluloid
    davinci-resolve
    ffmpeg-full
    gapless
    handbrake
    krita
    lollypop
    moonlight-qt
    onlyoffice-desktopeditors
    python3Full
    resources
    teams-for-linux
    thunderbird
    vipsdisp
    xfce.mousepad
  ];
}
