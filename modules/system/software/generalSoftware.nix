{pkgs, inputs, systemArch, ...}:
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
    lollypop
    moonlight-qt
    obs-studio
    pitivi
    python3Full
    resources
    thunderbird
    vipsdisp
    xfce.mousepad
  ] ++
  [
    inputs.zen-browser.packages."${systemArch}".specific
  ];
}
