{pkgs, ...}:
{
  services =
  {
    devmon.enable = true;
    gvfs.enable = true;
    fstrim.enable = true;
    udisks2.enable = true;
    tumbler.enable = true;
  };
  environment.systemPackages = with pkgs;
  [
    ffmpegthumbnailer
    file-roller
    gparted
    lxde.lxmenu-data
    pcmanfm
  ];
  environment.sessionVariables =
  {
    XDG_MENU_PREFIX = "lxde-";
  };
}