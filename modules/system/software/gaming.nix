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
    goverlay
    heroic
    moltengamepad
    prismlauncher
    protonplus
    protontricks
    jstest-gtk
    libstrangle
    mangohud
    scanmem
    vesktop
    vkbasalt
  ];
}
