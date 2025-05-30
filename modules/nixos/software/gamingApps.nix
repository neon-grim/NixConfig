{pkgs, ...}:
{
  environment.systemPackages = with pkgs;
  [
    heroic
    jstest-gtk
    libstrangle
    mangohud
    mangojuice
    protonplus
    ryujinx
    scanmem
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
      gamescopeSession =
      {
        enable = true;
        args =
        [
          "--prefer-output" "DP-1"
        ];
      };
      dedicatedServer.openFirewall = true;
      protontricks.enable = true;
      remotePlay.openFirewall = true;
    };
  };
}
