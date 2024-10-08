{config, lib, ...}:
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
    software =
    {
      flatpak = lib.mkOption
      {
        type= lib.types.bool;
        default = false;
      };
      virtualization = lib.mkOption
      {
        type = lib.types.bool;
        default = false;
      };
    };
    system =
    {
      timeZone = lib.mkOption
      {
        type= lib.types.str;
        default = "";
      };
      locale = lib.mkOption
      {
        type= lib.types.str;
        default = "";
      };
    };
  };
}