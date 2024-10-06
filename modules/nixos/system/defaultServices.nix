{host, config, user, ...}:
{
  console.keyMap = "sg";
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
}