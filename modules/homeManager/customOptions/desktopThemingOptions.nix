{lib, ...}:
{
  options.desktop.theming =
  {
    gtk =
    {
      name = lib.mkOption
      {
        type = lib.types.str;
        default = "";
      };
      package = lib.mkOption
      {
        type = lib.types.package;
        default = "";
      };
    };
    palette =
    {
      accentDefault = lib.mkOption
      {
        type = lib.types.str;
        default = "";
      };
      accentDark = lib.mkOption
      {
        type = lib.types.str;
        default = "";
      };
      bkDefault = lib.mkOption
      {
        type = lib.types.str;
        default = "";
      };
      bkBrighter = lib.mkOption
      {
        type = lib.types.str;
        default = "";
      };
      bkBrightest = lib.mkOption
      {
        type = lib.types.str;
        default = "";
      };
      bkUrgent = lib.mkOption
      {
        type = lib.types.str;
        default = "";
      };
      txDefault = lib.mkOption
      {
        type = lib.types.str;
        default = "";
      };
      txBrighter = lib.mkOption
      {
        type = lib.types.str;
        default = "";
      };
      txBrightest = lib.mkOption
      {
        type = lib.types.str;
        default = "";
      };
      txUrgent = lib.mkOption
      {
        type = lib.types.str;
        default = "";
      };
    };
  };
}