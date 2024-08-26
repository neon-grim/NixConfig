{pkgs, ...}:
{
  hardware.graphics =
  {
    extraPackages = [pkgs.amdvlk];
    extraPackages32 = [pkgs.driversi686Linux.amdvlk];
  };
  environment.variables =
  {
    AMD_VULKAN_ICD = "RADV";
  };
}