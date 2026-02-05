{pkgs, config, ...}:
let
  isLts = config.desktop.kernel.lts;
in
{
  imports =
  [
    ./kernelConfig/kernelModules.nix
  ];
  boot =
  {
    kernelPackages = 
    ( 
      if isLts then 
        pkgs.cachyosKernels.linuxPackages-cachyos-lts
      else
        pkgs.cachyosKernels.linuxPackages-cachyos-bore
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