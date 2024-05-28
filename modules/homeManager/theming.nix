{pkgs, host, ...}:
let
  inherit (import ../../hosts/${host}/variables.nix)
    cursorSize;
in
{
  # Cursor Theme
  home =
  {
    pointerCursor = 
    {
      gtk.enable = true;
      x11.enable = true;
      name = "Bibata-Original-Classic";
      package = pkgs.bibata-cursors;
      size = cursorSize;
    };
  };
  # GTK Theme
  gtk = 
  {
    enable = true;
    theme = 
    {
      name = "Kanagawa-BL-LB";
      package = pkgs.kanagawa-gtk-theme;
    };
    iconTheme =
    {
      name = "BeautyLine";
      package = pkgs.beauty-line-icon-theme;
    };
    gtk3.extraConfig = 
    {
      gtk-application-prefer-dark-theme=1;
    };
    gtk4.extraConfig = 
    {
      gtk-application-prefer-dark-theme=1;
    };
  };
  # QT Theme
  qt = 
  {
    enable = true;
    platformTheme.name = "gtk";
    style = 
    {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };
}
