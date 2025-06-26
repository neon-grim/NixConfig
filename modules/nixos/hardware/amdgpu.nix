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
    hardware =
    {
      graphics =
      {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs;
        [
          libva
          libvdpau
          vaapiVdpau
          libvdpau-va-gl
        ];
        extraPackages32 = with pkgs.pkgsi686Linux; 
        [
          vaapiVdpau
          libvdpau-va-gl
        ];
      };
    };
    services.xserver.videoDrivers = 
    [
      "amdgpu"
    ];
  };
}