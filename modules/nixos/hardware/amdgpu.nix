{pkgs, config, lib, ...}:
{
  config = lib.mkIf (config.desktop.drivers.amd.enable)
  {
    hardware =
    {
      amdgpu.overdrive =
      {
        enable = true;
        ppfeaturemask = "0xf7fff";
      };
      graphics =
      {
        enable = true;
        enable32Bit = true;
      };
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