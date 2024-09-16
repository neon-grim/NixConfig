{pkgs, ...}:
{
  services.xserver.videoDrivers = ["amdgpu"];
  programs.corectrl = 
  {
    enable = true;
    gpuOverclock.enable = true;
  };
  hardware =
  {
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
}