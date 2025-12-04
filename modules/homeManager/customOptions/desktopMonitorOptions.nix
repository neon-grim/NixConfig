{lib, ...}:
{
  options.desktop.mainMon =
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
    posX = lib.mkOption
    {
      type = lib.types.str;
      default = "";
    };
    posY = lib.mkOption
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
}