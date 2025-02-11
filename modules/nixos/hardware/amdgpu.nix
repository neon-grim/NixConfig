{pkgs, config, lib, ...}:
{
  config = lib.mkIf (config.desktop.drivers.amd.enable)
  {
    environment.systemPackages = with pkgs;
    [
      lact
      vulkan-tools
    ];
    hardware =
    {
      amdgpu =
      {
        opencl.enable = true;
      };
      graphics =
      {
        enable = true;
        enable32Bit = true;
      };
    };
    services.xserver.videoDrivers = 
    [
      "amdgpu"
    ];
    programs.corectrl =
    {
      enable = true;
      gpuOverclock.enable = true;
    };
  };
}