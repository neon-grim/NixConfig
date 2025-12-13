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
    dolphin-emu
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
