{pkgs, ...}:
{
  environment.systemPackages = with pkgs;
  [
    bottles
    python3Full
    resources
  ] ++ [
    gpu-screen-recorder-gtk
    moonlight-qt
  ] ++ [
    handbrake
    davinci-resolve
    gimp
    pinta
    pitivi
  ] ++ [
    celluloid
    gapless
    image-roll
  ] ++ [
    thunderbird
    onlyoffice-desktopeditors
    xfce.mousepad
  ] ++ [
    teams-for-linux
    vesktop
  ];
  programs =
  {
    gpu-screen-recorder =
    {
      enable = true;
    };
    obs-studio =
    {
      enable = true;
      enableVirtualCamera = true;
      plugins = with pkgs.obs-studio-plugins;
      [
        obs-vkcapture
      ];
    };
  };
}
