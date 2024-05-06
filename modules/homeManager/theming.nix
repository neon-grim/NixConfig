{pkgs, ... }:
{
  # set cursor theme
  home = 
  {
    pointerCursor = 
    {
      gtk.enable = true;
      x11.enable = true;
      name = "Bibata-Original-Classic";
      package = pkgs.bibata-cursors;
      size = 24;
    };
  };
  # set gtk theme  
  gtk = 
  {
    enable = true;
    theme = 
    {
      name = "Nordic";
      package = pkgs.nordic;
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
  # set qt theme  
  qt = 
  {
    enable = true;
    platformTheme.name = "gtk";
    style = 
    {
      name = "Nordic";
      package = pkgs.nordic;
    };
  };
}
