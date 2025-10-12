{pkgs, user, config, ...}:
let
  # Main Monitor config
  mainMonHeight = config.home-manager.users.${user}.desktop.system.mainMon.height;
  mainMonWidth = config.home-manager.users.${user}.desktop.system.mainMon.width;
  # Keybaord config
  kbLayout = config.home-manager.users.${user}.desktop.system.kb.layout;
  kbVariant = config.home-manager.users.${user}.desktop.system.kb.variant;
in
{
  environment.systemPackages = with pkgs;
  [
    heroic
    jstest-gtk
    mangohud
    mangojuice
    protonplus
    ryubing
    shadps4
    vkbasalt
  ];
  programs =
  {
    gamescope =
    {
      enable = true;
      capSysNice = true;
      package = pkgs.gamescope_git.overrideAttrs
      (_:
        {
          NIX_CFLAGS_COMPILE = ["-fno-fast-math"];
        }
      );
      args =
      [
        "--adaptive-sync"
        "--fullscreen"
        "--mangoapp"
        "--force-grab-cursor" 
        "-W ${mainMonWidth}"
        "-H ${mainMonHeight}"
        "-o 30"
      ];
      env =
      {
        XKB_DEFAULT_LAYOUT = kbLayout;
        XKB_DEFAULT_VARIANT = kbVariant;
      };
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
