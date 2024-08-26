{pkgs, ...}:
{
  environment.systemPackages = with pkgs;
  [
    vulkan-tools
  ];
  hardware.graphics =
  {
    extraPackages = [pkgs.amdvlk];
  };
  environment.variables =
  {
    AMD_VULKAN_ICD = "RADV";
  };
}