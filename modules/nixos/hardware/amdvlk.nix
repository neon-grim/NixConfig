{pkgs, config, lib, ...}:
let
  amdvlkEnabled = config.desktop.drivers.amdvlk;
in
{
  hardware.amdgpu.amdvlk.enable = amdvlkEnabled;
  environment.variables = lib.mkIf (amdvlkEnabled)
  {
    AMD_VULKAN_ICD = "RADV";
  };
}