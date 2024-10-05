{host, config, username, ...}:
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
        layout = config.home-manager.users.${username}.desktop.kbLayout;
        variant = config.home-manager.users.${username}.desktop.kbVariant;
      };
    };
  };
}