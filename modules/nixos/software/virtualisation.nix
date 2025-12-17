{config, lib, pkgs, pkgs-stable, ...}:
{
  config = lib.mkIf (config.desktop.software.virtualization)
  {
    environment.systemPackages =
    [
      pkgs.winboat
      pkgs-stable.docker-compose
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
        package = pkgs-stable.docker;
      };
      libvirtd.enable = true;
      spiceUSBRedirection.enable = true;
    };
  };
}