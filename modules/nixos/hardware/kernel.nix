{pkgs, config, ...}:
{
  imports =
  [
    ./kernelConfig/cachyosKernel.nix
    ./kernelConfig/defaultKernel.nix
    ./kernelConfig/kernelModules.nix
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
