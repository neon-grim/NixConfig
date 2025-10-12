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
      desc= lib.mkOption
      {
        type = lib.types.str;
        default = "";
      };
      height = lib.mkOption
      {
        type = lib.types.str;
        default = "";
      };
      width = lib.mkOption
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
      paperOne = lib.mkOption
      {
        type = lib.types.str;
        default = "";
      };
      paperTwo = lib.mkOption
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