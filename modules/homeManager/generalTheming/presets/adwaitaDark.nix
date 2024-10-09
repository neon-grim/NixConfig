{config, lib, ...}:
{
  theming = lib.mkIf (config.desktop.style.themePreset == "")
  {
    gtk =
    {
      name = "";
      package = "";
    };
    palette =
    {
      bkOne = "1f1f28";
      bkTwo = "2a2a37";
      bkThree = "414148";
      bkFour ="ce0205";
      bkFive ="dcd7ba";
      txOne = "c8c3aa";
      txTwo = "dcd7ba";
      txThree = "e6c384";
      txFour = "000000";
      txFive = "1f1f28";
    };
  };
}