{pkgs, config, lib, ...}:
{
  imports =
  [
    ./graphicsConfig/amdvlk.nix
    ./graphicsConfig/lact.nix
  ];
  config = lib.mkIf (config.desktop.amd.enable)
  {
    boot.kernelParams =
    [
      "amdgpu.ppfeaturemask=0xfffd7fff"
    ];
    hardware.graphics =
    {
      enable = true;
    };
    services.xserver.videoDrivers = 
    [
      "amdgpu"
    ];
  };
}