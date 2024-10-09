{pkgs, config, lib, ...}:
{
  config = lib.mkIf (config.desktop.drivers.amd.enable)
  {
    environment.systemPackages = with pkgs;
    [
      vulkan-tools
    ];
    hardware =
    {
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