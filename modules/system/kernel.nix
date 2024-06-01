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
    kernelPackages = pkgs.linuxPackages_latest;
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
    ];
    # Load Kernel Module
    kernelModules = 
    [
      "xpad-noone"
    ];
  };
}
