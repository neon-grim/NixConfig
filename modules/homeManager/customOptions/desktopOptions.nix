{lib, ...}:
{
  options.desktop =
  {
    style =
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
      };
      themePreset = lib.mkOption
      {
        type = lib.types.str;
        default = "";
      };
    };
    system =
    {
      hyprlock = lib.mkOption
      {
        type = lib.types.bool;
        default = false;
      };
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
      mainMon =
      {
        name = lib.mkOption
        {
          type = lib.types.str;
          default = "";
        };
        res = lib.mkOption
        {
          type = lib.types.str;
          default = "";
        };
        oc = lib.mkOption
        {
          type = lib.types.str;
          default = "";
        };
        pos = lib.mkOption
        {
          type = lib.types.str;
          default = "";
        };
      };
    };
  };
}