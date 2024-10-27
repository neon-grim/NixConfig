{config, lib, ...}:
{
  theming = lib.mkIf (config.desktop.style.themePreset == "kanagawa")
  {
    gtk =
    {
      name = "";
      package = "";
    };
    palette =
    {
      accentDefault = "";
      accentDark = "";
      bkDefault = "";
      bkBrighter = "";
      bkBrightest = "";
      bkUrgent ="";
      txDefault = "";
      txBrighter = "";
      txBrightest = "";
      txUrgent = "";
    };
  };
}