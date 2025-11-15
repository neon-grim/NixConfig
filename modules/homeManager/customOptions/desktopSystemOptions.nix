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
    compositors =
    {
      defaultSession = lib.mkOption
      {
        type = lib.types.str;
        default = "";
      };
      hyprland.enable = lib.mkOption
      {
        type = lib.types.bool;
        default = false;
      };
      niri.enable = lib.mkOption
      {
        type = lib.types.bool;
        default = false;
      };
    };
    workspaceCount = lib.mkOption
    {
      type = lib.types.str;
      default = "";
    };
  };
}