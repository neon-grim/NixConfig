{pkgs, config, lib, ...}:
{
  config = lib.mkIf (config.desktop.drivers.amd.enable)
  {
    hardware =
    {
      amdgpu.overdrive.enable = true;
      graphics.enable = true;
    };
    services =
    {
      lact.enable = true;
      xserver.videoDrivers = 
      [
        "amdgpu"
      ];
    };
  };
}