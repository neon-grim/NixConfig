{lib, ...}:
{
  options.desktop =
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
    printing =
    {
      enable = lib.mkOption
      {
        type= lib.types.bool;
        default = false;
      };
    };
  };
}