{pkgs, ...}:
{
  environment.systemPackages = with pkgs;
  [
    swaybg
    xwayland-satellite
  ];
  programs =
  {
    niri.enable = true;
  };
}