{pkgs, inputs, lib, ...}:
let
  hyprctl = "${lib.getExe' inputs.hyprland.packages.x86_64-linux.hyprland "hyprctl"} -i 0";
  notify-send = lib.getExe pkgs.libnotify;
  startScript = pkgs.writers.writeDash "gamemode-start"
  ''
    ${hyprctl} --batch "\
      keyword animations:enabled false; \
      keyword decoration:blur:enabled false; \
      keyword decoration:drop_shadow false; \
      keyword cursor:min_refresh_rate 0; \
      keyword cursor:no_hardware_cursors true; \
      keyword cursor:no_break_fs_vrr true; \
      keyword general:allow_tearing true; \
      keyword render:direct_scanout true; \
      keyword monitor desc:Samsung Electric Company Odyssey G95SC H1AK500000, 5120x1440@240.00, 1440x640, 1, vrr, 2, bitdepth, 10;"
    ${notify-send} -u low -a 'Gamemode' 'Tweaks on, wait 10s for game to start.'
    sleep 10s
  '';
  endScript = pkgs.writers.writeDash "gamemode-end"
  ''
    ${hyprctl} reload
    ${notify-send} -u low -a 'Gamemode' 'Tweaks off, hyprland reloaded.'
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
