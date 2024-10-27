{pkgs, ...}:
{
  environment.systemPackages = with pkgs;
  [
    ffmpegthumbnailer
    nemo-fileroller
    nemo-with-extensions
    pika-backup
  ];
  programs =
  {
    gnome-disks.enable = true;
  };
  services =
  {
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
    tumbler.enable = true;
  };
}