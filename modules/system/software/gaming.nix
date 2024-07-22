{pkgs, ...}:
{
  hardware.xone.enable = true;
  programs =
  {
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
    bottles
    corectrl
    discord
    heroic
    moltengamepad
    prismlauncher
    protonplus
    goverlay
    jstest-gtk
    libstrangle
    mangohud
    scanmem
    vesktop
    vkbasalt
  ];
}
