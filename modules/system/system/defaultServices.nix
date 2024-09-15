{host, ...}:
let
  inherit (import ../../../hosts/${host}/hostSpecific/systemConfig.nix)
    layout
    variant;
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
        layout = "${layout}";
        variant = "${variant}";
      };
    };
  };
}