{pkgs, config, ...}:
{
  boot =
  {
    kernelPackages = pkgs.linuxPackages_zen;
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
