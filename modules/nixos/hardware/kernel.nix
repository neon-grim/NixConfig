{pkgs, config, ...}:
let
  kernelName = config.desktop.kernel.name;
in
{
  imports =
  [
    ./kernelConfig/scxConfig.nix
    ./kernelConfig/kernelModules.nix
    ./kernelConfig/xpadExtraRules.nix
  ];
  boot =
  {
    kernelPackages = 
    (
      if (config.desktop.kernel.name == "lqx") then pkgs.linuxPackages_lqx
      else if (config.desktop.kernel.name == "zen") then pkgs.linuxPackages_zen
      else pkgs.linuxPackages_latest
    );
    kernelParams =
    [
      "quiet"
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
