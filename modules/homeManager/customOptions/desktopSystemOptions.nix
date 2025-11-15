{lib, ...}:
{
  options.desktop.system =
  {
    kb =
    {
      layout = lib.mkOption
      {
        type = lib.types.str;
        default = "";
      };
      variant = lib.mkOption
      {
        type = lib.types.str;
        default = "";
      };
    };
  };
}