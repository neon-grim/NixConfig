{lib, ...}:
{
  options.desktop.system =
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
}