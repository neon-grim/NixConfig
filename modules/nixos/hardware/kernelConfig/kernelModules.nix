{...}:
{
  boot.kernelModules =
  [
    "ntsync"
  ];
  hardware =
  {
    cpu.amd.updateMicrocode = true;
    enableAllFirmware = true;
    steam-hardware.enable = true;
  };
  zramSwap =
  {
    enable = true;
  };
}

