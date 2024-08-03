{pkgs, ...}:
{
  programs =
  {
    sway =
    {
      enable = true;
      wrapperFeatures.gtk = true;
    };
  };
  environment.systemPackages = with pkgs;
  [
    sov
    Swaysome
    swww
    wayshot
  ];
}