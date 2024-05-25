{pkgs, config, ...}:
{
  boot =
  {
    # Bootloader
    loader =
    {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    # Set Kernel
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    # Kernel Parameters
    kernelParams = 
    [ 
      "amdgpu.ppfeaturemask=0xffffffff"
      "quiet" 
    ];
    kernel.sysctl = 
    {
      "vm.max_map_count" = 2147483642;
    };
    # Kernel Modules
    extraModulePackages = 
    [
      # Custom Xpad Module
      (config.boot.kernelPackages.callPackage ./../derivations/xpad.nix {})
      # Virtual Cam
      config.boot.kernelPackages.v4l2loopback
    ];
    # Load Kernel Module
    kernelModules = 
    [
      "xpad-noone"
      "v4l2loopback"
    ];
    extraModprobeConfig = ''options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1'';
  };
}
