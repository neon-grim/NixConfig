{lib, ...}:
{
  options.desktop.niri =
  {
    startup = lib.mkOption
    {
      type = lib.types.str;
      default = "";
    };
    input = lib.mkOption
    {
      type = lib.types.str;
      default = "";
    };
    outputs = lib.mkOption
    {
      type = lib.types.str;
      default = "";
    };
    layout = lib.mkOption
    {
      type = lib.types.str;
      default = "";
    };
    windowRules = lib.mkOption
    {
      type = lib.types.str;
      default = "";
    };
    environmentVariables = lib.mkOption
    {
      type = lib.types.str;
      default = "";
    };
    binds = lib.mkOption
    {
      type = lib.types.str;
      default = "";
    };
  };
}