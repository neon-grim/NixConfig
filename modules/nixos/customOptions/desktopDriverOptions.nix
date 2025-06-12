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
    kernel =
    {
      name = lib.mkOption
      {
        type= lib.types.str;
        default = "";
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