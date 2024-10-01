{pkgs, inputs, lib, ...}:
let
  hyprctl = "${lib.getExe' inputs.hyprland.packages.x86_64-linux.hyprland "hyprctl"} -i 0";
  notify-send = lib.getExe pkgs.libnotify;
  startScript = pkgs.writers.writeDash "gamemode-start"
  ''
    ${notify-send} -u low -a 'Gamemode' 'Gamemode On.'
  '';
  endScript = pkgs.writers.writeDash "gamemode-end"
  ''
    ${notify-send} -u low -a 'Gamemode' 'Gamemode Off.'
  '';
in
{
  programs =
  {
    gamemode =
    {
      enable = true;
      enableRenice = true;
      settings =
      {
        custom =
        {
          start = startScript.outPath;
          end = endScript.outPath;
        };
      };
    };
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
