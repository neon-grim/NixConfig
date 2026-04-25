{pkgs, user, config, ...}:
let
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
}
