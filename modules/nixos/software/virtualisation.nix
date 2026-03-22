{config, lib, pkgs, ...}:
{
  config = lib.mkIf (config.desktop.software.virtualization)
  {
    environment.systemPackages = with pkgs;
    [
      winboat
      docker-compose
    ];
    programs.virt-manager =
    {
      enable = true;
    };
    virtualisation =
    {
      docker = 
      {
        enable = true;
      };
      libvirtd.enable = true;
      spiceUSBRedirection.enable = true;
    };
  };
}