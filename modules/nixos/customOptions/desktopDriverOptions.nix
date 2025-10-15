{lib, ...}:
{
  options.desktop =
  {
    drivers =
    {
      amd =
      {
        enable = lib.mkOption
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
    kernel =
    {
      lts = lib.mkOption
      {
        type= lib.types.bool;
        default = false;
      };
    };
  };
}