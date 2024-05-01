{ config, pkgs, ... }:
{
  boot =
  {
    # bootloader
    loader =
    {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    # set Kernel to zen
    kernelPackages = pkgs.linuxPackages_zen;
    # set overclocking and disable systemd log
    kernelParams = 
    [ 
      "amdgpu.ppfeaturemask=0xffffffff"
      "quiet" 
    ];
    # download kernel packages for later use
    extraModulePackages = 
    [ 
      # modified xpad driver
      (config.boot.kernelPackages.callPackage ./../derivations/xpad.nix {}) 
    ];
    # set Kernel module
    kernelModules = [ "xpad-noone" ];
  };
}
