{config, lib, ...}:
{
  theming = lib.mkIf (config.desktop.style.themePreset == "andromeda")
  {
    gtk =
    {
      name = "Andromeda-standard-buttons";
      package = "andromeda-gtk-theme";
    };
    palette =
    {
      accentDefault = "d8dee9";
      accentDark = "111216";
      bkDefault = "111216";
      bkBrighter = "23262e";
      bkBrightest = "2b2f38";
      bkUrgent ="ce0205";
      txDefault = "797e86";
      txBrighter = "d8dee9";
      txBrightest = "aac8ff";
      txUrgent = "000000";
    };
  };
}