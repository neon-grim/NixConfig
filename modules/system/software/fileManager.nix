{pkgs, config, ...}:
{
  services =
  {
    devmon.enable = true;
    gvfs.enable = true;
    fstrim.enable = true;
    udisks2.enable = true;
    tumbler.enable = true;
  };
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
    pcmanfm
    gnome.file-roller
  ];
}