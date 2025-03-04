{pkgs, ...}:
{
  environment.systemPackages = with pkgs;
  [
    gpu-screen-recorder-gtk
    heroic
    jstest-gtk
    libstrangle
    mangohud
    mangojuice
    protonplus
    protonup-qt
    ryujinx
    scanmem
    vesktop
    vkbasalt
    vkbasalt-cli
  ];
  programs =
  {
    gamescope =
    {
      enable = true;
    };
    gamemode =
    {
      enable = true;
      enableRenice = true;
    };
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
    steam =
    {
      enable = true;
      gamescopeSession.enable = true;
      dedicatedServer.openFirewall = true;
      protontricks.enable = true;
      remotePlay.openFirewall = true;
    };
  };
}
