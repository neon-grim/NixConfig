{pkgs, config, ...}:
{
  hardware =
  {
    cpu.amd.updateMicrocode = true;
    enableAllFirmware = true;
    opentabletdriver.enable = true;
    steam-hardware.enable = true;
    xpadneo.enable = true;
  };
  zramSwap =
  {
    enable = true;
  };
}

