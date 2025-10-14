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
    workspaceCount = lib.mkOption
    {
      type = lib.types.str;
      default = "";
    };
  };
}