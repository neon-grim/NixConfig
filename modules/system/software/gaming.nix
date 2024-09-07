{pkgs, ...}:
{
  hardware.xone.enable = true;
  programs =
  {
    corectrl = 
    {
      enable = true;
      gpuOverclock.enable = true;
    };
    gamemode.enable = true;
    steam = 
    {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
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
