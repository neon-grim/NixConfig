{pkgs, config, ...}:
{
  hardware.xone.enable = true;
  zramSwap.enable = true;
  boot =
  {
    loader =
    {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams =
    [
      "quiet"
      "amd_pstate=active"
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
