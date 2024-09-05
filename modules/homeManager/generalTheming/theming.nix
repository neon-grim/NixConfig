{pkgs, host, gtkTheme, ...}:
let
  inherit (import ../../../hosts/${host}/hostSpecific/gtkThemes/${gtkTheme}.nix)
    gtkThemePackage
    gtkThemeName;
  inherit (import ../../../hosts/${host}/hostSpecific/themingConfig.nix)
    cursorSize
    cursorThemePackage
    cursorThemeName
    font
    fontSize
    fontPackage
    iconThemeName
    iconThemePackage;
in
{
  # Cursor Theme
  home =
  {
    pointerCursor = 
    {
      gtk.enable = true;
      x11.enable = true;
      package = pkgs."${cursorThemePackage}";
      name = "${cursorThemeName}";
      size = cursorSize;
    };
  };
  # GTK Theme
  gtk = 
  {
    enable = true;
    theme = 
    {
      package = pkgs."${gtkThemePackage}";
      name = "${gtkThemeName}";
    };
    iconTheme =
    {
      package = pkgs."${iconThemePackage}";
      name = "${iconThemeName}";
    };
    gtk3.extraConfig = 
    {
      gtk-application-prefer-dark-theme=1;
    };
    gtk4.extraConfig = 
    {
      gtk-application-prefer-dark-theme=1;
    };
    font = 
    {
      name = "${font}";
      size = fontSize;
    };
  };
  # QT Theme
  qt = 
  {
    enable = true;
    platformTheme.name = "gtk3";
    style = 
    {
      name = "adwaita-dark";
    };
  };
}
