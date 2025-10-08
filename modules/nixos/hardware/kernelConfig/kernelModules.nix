{pkgs, config, ...}:
{
  boot.kernelModules =
  [
    "ntsync"
  ];
  hardware =
  {
    cpu.amd.updateMicrocode = true;
    enableAllFirmware = true;
    opentabletdriver.enable = true;
    steam-hardware.enable = true;
  };
  zramSwap =
  {
    enable = true;
  };
}

