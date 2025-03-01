{pkgs, config, ...}:
{
  hardware =
  {
    bluetooth =
    {
      enable = true;
      powerOnBoot = true;
    };
    xone =
    {
      enable = true;
    };
  };
  zramSwap =
  {
    enable = true;
  };
}

