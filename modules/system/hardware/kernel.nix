{pkgs, config, ...}:
{
  boot =
  {
    loader =
    {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_zen;
    kernelParams = 
    [ 
      "amdgpu.ppfeaturemask=0xffffffff"
      "quiet" 
    ];
    kernel.sysctl = 
    {
      "vm.max_map_count" = 2147483642;
    };
    extraModulePackages = 
    [
      (config.boot.kernelPackages.callPackage ./../../derivations/xpad.nix {})
    ];
    kernelModules = 
    [
      "xpad-noone"
    ];
  };
}
