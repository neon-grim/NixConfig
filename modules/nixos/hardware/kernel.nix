{pkgs, config, ...}:
{
  boot =
  {
    extraModulePackages =
    [
      (config.boot.kernelPackages.callPackage ./../../derivations/xpad.nix {})
    ];
    kernelModules =
    [
      "xpad-noone"
    ];
    kernelPackages = pkgs.linuxPackages_lqx;
    kernelParams =
    [
      "quiet"
    ];
    kernel.sysctl =
    {
      "vm.max_map_count" = 2147483642;
    };
    loader =
    {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
  hardware.xone =
  {
    enable = true;
  };
  zramSwap =
  {
    enable = true;
  };
}
