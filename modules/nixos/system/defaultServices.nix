{host, config, user, ...}:
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
        layout = config.home-manager.users.${user}.desktop.kbLayout;
        variant = config.home-manager.users.${user}.desktop.kbVariant;
      };
    };
  };
  
  console.keyMap = "sg";
  
  system.stateVersion = "23.11";
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  i18n.defaultLocale = config.desktop.system.locale;
  time.timeZone = config.desktop.system.timeZone;
}