{pkgs, lib, config, user, ...}:
{
  config =
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