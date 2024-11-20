{pkgs, ...}:
{
  environment.systemPackages = with pkgs;
  [
    goverlay
    heroic
    jstest-gtk
    libstrangle
    mangohud
    protonplus
    ryujinx
    scanmem
    vesktop
    vkbasalt
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
