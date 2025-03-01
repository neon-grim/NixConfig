{pkgs, config, lib, ...}:
{
  config = lib.mkIf (config.desktop.kernel.cachyos)
  {
    boot =
    {
      kernelPackages = lib.mkForce pkgs.linuxPackages_cachyos;
    };
    services =
    {
      scx =
      {
        enable = true;
        scheduler = "scx_lavd";
      };
    };
  };
}