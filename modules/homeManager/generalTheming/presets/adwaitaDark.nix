{config, lib, ...}:
{
  desktop.theming = lib.mkIf (config.desktop.style.themePreset == "")
  {
    gtk =
    {
      name = "";
      #package = pkgs.;
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