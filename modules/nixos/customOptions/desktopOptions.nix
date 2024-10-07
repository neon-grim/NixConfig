{config, lib, ...}:
{
  desktop =
  {
    drivers =
    {
      amdvlk = lib.mkOption
      {
        type= lib.types.bool;
        default = false;
      };
      printing = lib.mkOption
      {
        type= lib.types.bool;
        default = false;
      };
    };
    software =
    {
      flatpak = lib.mkOption
      {
        type= lib.types.bool;
        default = false;
      };
    };
  };
}