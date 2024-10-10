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
    protontricks
    ryujinx
    scanmem
    vesktop
    vkbasalt
  ];
  programs =
  {
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
      remotePlay.openFirewall = true;
    };
  };
}
