{config, user, inputs, ...}:
let
  kbLayout = config.home-manager.users.${user}.desktop.system.kb.layout;
  kbVariant = config.home-manager.users.${user}.desktop.system.kb.variant;
in
{
  services.xserver =
  {
    enable = true;
    xkb =
    {
      layout = kbLayout;
      variant = kbVariant;
    };
  };
}
