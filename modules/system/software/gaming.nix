{pkgs, ...}:
{
  programs =
  {
    gamemode.enable = true;
    steam = 
    {
      enable = true;
      gamescopeSession.enable = true;
      dedicatedServer.openFirewall = true;
      remotePlay.openFirewall = true;
    };
  };
  environment.systemPackages = with pkgs;
  [
    goverlay
    heroic
    jstest-gtk
    libstrangle
    mangohud
    protonplus
    protontricks
    scanmem
    vesktop
    vkbasalt
  ];
}
