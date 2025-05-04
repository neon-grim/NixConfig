{pkgs, config, ...}:
{
  imports =
  [
    ./kernelConfig/kernelPackage.nix
    ./kernelConfig/kernelModules.nix
    ./kernelConfig/xpadExtraRules.nix
  ];
  boot =
  {
    kernelParams =
    [
      "quiet"
    ];
    kernel.sysctl =
    {
      "kernel.split_lock_mitigate" = 0;
      "vm.max_map_count" = 2147483642;
      "vm.vfs_cache_pressure" = 10;
    };
    loader =
    {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
