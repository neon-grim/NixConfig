{pkgs, ...}:
{
  environment.sessionVariables =
  {
    XDG_MENU_PREFIX = "lxde-";
  };
  environment.systemPackages = with pkgs;
  [
    ffmpegthumbnailer
    file-roller
    gparted
    lxde.lxmenu-data
    pcmanfm
  ];
  services =
  {
    devmon.enable = true;
    gvfs.enable = true;
    fstrim.enable = true;
    udisks2.enable = true;
    tumbler.enable = true;
  };
}