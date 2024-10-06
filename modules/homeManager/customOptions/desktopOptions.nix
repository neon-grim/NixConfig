{lib, ...}:
{
  options =
  {
    desktop =
    {
      cursorSize = lib.mkOption
      {
        type = lib.types.int;
        default = 24;
      };
      font =
      {
        name = lib.mkOption
        {
          type = lib.types.str;
          default = "JetBrainsMono Nerd Font";
        };
        size = lib.mkOption
        {
          type = lib.types.int;
          default = 14;
        };
      };
      kbLayout = lib.mkOption
      {
        type = lib.types.str;
        default = "ch";
      };
      kbVariant = lib.mkOption
      {
        type = lib.types.str;
        default = "de_nodeadkeys";
      };
      mainMod = lib.mkOption
      {
        type = lib.types.str;
        default = "SUPER";
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
          default = "preferred";
        };
        oc = lib.mkOption
        {
          type = lib.types.str;
          default = "preferred";
        };
        pos = lib.mkOption
        {
          type = lib.types.str;
          default = "auto";
        };
      };
    };
  };
}