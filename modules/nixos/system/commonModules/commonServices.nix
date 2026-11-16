{pkgs, ...}:
{
  environment.systemPackages = with pkgs;
  [
    clamav
  ];
  services =
  {
    dbus.enable = true;
    devmon.enable = true;
    geoclue2.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
    tumbler.enable = true;
    clamav =
    {
      daemon =
      {
        enable = true;
        settings =
        {
          MaxScanSize = "20G";
          MaxFileSize = "4G";
          MaxRecursion = 25;
          MaxFiles = 100000;
        };
      };
      updater.enable = true;
    };
  };
}