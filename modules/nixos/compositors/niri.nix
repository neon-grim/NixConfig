{pkgs, lib, config, user, ...}:
{
  config = lib.mkIf (config.home-manager.users.${user}.desktop.system.compositors.niri.enable)
  {
    environment.systemPackages = with pkgs;
    [
      xwayland-satellite
    ];
    programs =
    {
      niri.enable = true;
    };
  };
}