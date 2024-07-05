{pkgs, ...}:
{
  programs =
  {
    dconf.enable = true;
    sway =
    {
      enable = true;
      wrapperFeatures.gtk = true;
    };
  };
  environment.systemPackages = with pkgs;
  [
    # Waybar Tools
    swww
    wayshot
  ];
}