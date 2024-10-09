{lib, ...}:
{
  options.desktop.drivers =
  {
    amd =
    {
      enable = lib.mkOption
      {
        type= lib.types.bool;
        default = false;
      };
      amdvlk = lib.mkOption
      {
        type= lib.types.bool;
        default = false;
      };
    };
    printing = lib.mkOption
    {
      type= lib.types.bool;
      default = false;
    };
  };
}