{pkgs, ... }:
{
    home = {
      pointerCursor = {
        gtk.enable = true;
        x11.enable = true;
        name = "Bibata-Original-Classic";
        package = pkgs.bibata-cursors;
        size = 24;
      };
    };
    
    gtk = {
      enable = true;
      theme = 
      {
        name = "Andromeda";
        package = pkgs.andromeda-gtk-theme;
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
    
    qt = {
    enable = true;
    platformTheme.name = "gtk";
    style = {
        name = "adwaita-dark";
        package = pkgs.adwaita-qt;
    };
  };
}
