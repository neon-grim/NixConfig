{pkgs, user, config, ...}:
let
  # Main Monitor config
  mainMonHeight = config.home-manager.users.${user}.desktop.mainMon.height;
  mainMonWidth = config.home-manager.users.${user}.desktop.mainMon.width;
  # Keybaord config
  kbLayout = config.home-manager.users.${user}.desktop.system.kb.layout;
  kbVariant = config.home-manager.users.${user}.desktop.system.kb.variant;
in
{
  environment.systemPackages = with pkgs;
  [
    vesktop
    heroic
    jstest-gtk
    mangohud
    moonlight-qt
    goverlay
    gpu-screen-recorder-gtk
    protonplus
    teamspeak6-client
    ryubing
    scanmem
    shadps4
    vkbasalt
  ];
  programs =
  {
    gamescope =
    {
      enable = true;
      args =
      [
        "--adaptive-sync"
        "--fullscreen"
        "--mangoapp"
        "--force-grab-cursor" 
        "-W ${mainMonWidth}"
        "-H ${mainMonHeight}"
      ];
      env =
      {
        XKB_DEFAULT_LAYOUT = kbLayout;
        XKB_DEFAULT_VARIANT = kbVariant;
      };
    };
    gpu-screen-recorder =
    {
      enable = true;
      package = pkgs.gpu-screen-recorder;
    };
    gamemode =
    {
      enable = true;
      enableRenice = true;
    };
    steam =
    {
      enable = true;
      protontricks.enable = true;
    };
  };
  services.sunshine =
  {
    enable = true;
    autoStart = false;
    capSysAdmin = true;
    openFirewall = true;
  };
}
