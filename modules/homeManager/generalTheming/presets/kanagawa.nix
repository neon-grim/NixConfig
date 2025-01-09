{pkgs, config, lib, ...}:
{
  theming = lib.mkIf (config.desktop.style.themePreset == "kanagawa")
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