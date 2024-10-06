{pkgs, ...}:
{
  hardware.amdgpu.amdvlk.enable = true;
  environment.variables =
  {
    AMD_VULKAN_ICD = "RADV";
  };
}