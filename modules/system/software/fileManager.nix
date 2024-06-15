{pkgs, ...}:
{
  services.tumbler.enable = true; 
  programs =
  {
    xfconf.enable = true;
    thunar =
    {
      enable = true;
      plugins = with pkgs.xfce; 
      [ 
        thunar-archive-plugin
        thunar-media-tags-plugin
        thunar-volman
      ];
    };
  };
  environment.systemPackages = with pkgs;
  [
    gnome.file-roller
  ];
}