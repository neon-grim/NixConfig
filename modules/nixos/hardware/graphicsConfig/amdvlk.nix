{pkgs, config, lib, ...}:
{
  config = lib.mkIf (config.desktop.amd.enable && config.desktop.amd.amdvlk)
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