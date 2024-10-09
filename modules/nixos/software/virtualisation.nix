{config, lib, ...}:
{
  config = lib.mkIf (config.desktop.software.virtualization)
  {
    programs.virt-manager.enable = true;
    virtualisation.libvirtd.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;
  };
}