{pkgs, config, lib, ...}:
{
  config = lib.mkIf (config.desktop.drivers.amd.amdvlk && config.desktop.drivers.amd.enable)
  {
    hardware.amdgpu.amdvlk.enable = true;
    environment.variables =
    {
      AMD_VULKAN_ICD = "RADV";
    };
  };
}