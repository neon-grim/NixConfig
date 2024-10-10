{pkgs, config, lib, ...}:
{
  config = lib.mkIf (config.desktop.drivers.amd.enable && config.desktop.drivers.amd.amdvlk)
  {
    environment.variables =
    {
      AMD_VULKAN_ICD = "RADV";
    };
    hardware.amdgpu.amdvlk =
    {
      enable = true;
    };
  };
}