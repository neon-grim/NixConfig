{host, config, user, ...}:
let
  kbLayout = config.home-manager.users.${user}.desktop.system.kb.layout;
  kbVariant = config.home-manager.users.${user}.desktop.system.kb.variant;
  locale = config.desktop.system.locale;
  time = config.desktop.system.timeZone;
in
{
  services =
  {
    dbus.enable = true;
    geoclue2.enable = true;
    xserver =
    {
      enable = true;
      xkb =
      {
        layout = kbLayout;
        variant = kbVariant;
      };
    };
  };
  
  console.keyMap = "sg";
  
  system.stateVersion = "23.11";
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  i18n.defaultLocale = locale;
  time.timeZone = time;
}