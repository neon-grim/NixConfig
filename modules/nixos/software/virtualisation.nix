{config, lib, ...}:
{
  config = lib.mkIf (config.desktop.software.virtualization)
  {
    environment.systemPackages = with pkgs;
    [
      winboat
      podman-compose
    ];
    programs.virt-manager =
    {
      enable = true;
    };
    virtualisation =
    {
      podman.enable = true;
      libvirtd.enable = true;
      spiceUSBRedirection.enable = true;
    };
  };
}