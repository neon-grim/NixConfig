{pkgs, ...}:
{
  services.xserver.videoDrivers = [ "amdgpu" ];
  programs.corectrl = 
  {
    enable = true;
    gpuOverclock.enable = true;
  };
  hardware =
  {
    amdgpu.amdvlk.enable = true;
    graphics =
    {
      enable = true;
      enable32Bit = true;
    };
  };
  environment.systemPackages = with pkgs;
  [
    vulkan-tools
  ];
  environment.variables =
  {
    AMD_VULKAN_ICD = "RADV";
  };
}