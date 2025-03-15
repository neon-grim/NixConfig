{lib, ...}:
{
  options.desktop.system =
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
      pos = lib.mkOption
      {
        type = lib.types.str;
        default = "";
      };
      maxHz = lib.mkOption
      {
        type = lib.types.str;
        default = "";
      };
      midHz = lib.mkOption
      {
        type = lib.types.str;
        default = "";
      };
      lowHz = lib.mkOption
      {
        type = lib.types.str;
        default = "";
      };
    };
    workspaceCount = lib.mkOption
    {
      type = lib.types.str;
      default = "";
    };
  };
}