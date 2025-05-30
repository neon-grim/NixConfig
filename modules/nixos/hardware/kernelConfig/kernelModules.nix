{pkgs, config, ...}:
{
  hardware =
  {
    cpu.amd.updateMicrocode = true;
    opentabletdriver.enable = true;
    xone.enable = true;
  };
  zramSwap =
  {
    enable = true;
  };
}

