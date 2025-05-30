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
      "amdgpu.ppfeaturemask=0xfffd7fff"
      "noresume"
    ];
    kernel.sysctl =
    {
      # Disable mitigations
      "kernel.split_lock_mitigate" = 0;
      # SteamOs
      "vm.max_map_count" = 2147483642;
      # Swap
      "vm.swappiness" = 10;
      "vm.vfs_cache_pressure" = 50;
      # Page flush tweaks
      "vm.dirty_ratio" = 4;
      "vm.dirty_background_ratio" = 2;
    };
    loader =
    {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
    tmp = 
    {
      cleanOnBoot = true;
    };
  };
}
