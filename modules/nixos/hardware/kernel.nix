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
      "vm.max_map_count" = 2147483642;
    };
    loader =
    {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
