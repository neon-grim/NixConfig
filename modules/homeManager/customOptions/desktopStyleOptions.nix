{lib, ...}:
{
  options.desktop.style =
  {
    cursorSize = lib.mkOption
    {
      type = lib.types.int;
      default = 16;
    };
    font =
    {
      name = lib.mkOption
      {
        type = lib.types.str;
        default = "";
      };
      size = lib.mkOption
      {
        type = lib.types.int;
        default = 11;
      };
      package = lib.mkOption
      {
        type = lib.types.package;
        default = "";
      };
    };
    themePreset = lib.mkOption
    {
      type = lib.types.str;
      default = "";
    };
  };
}