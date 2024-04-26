{pkg, ... }:
{
  home-manager.users.ashen_one = 
  {
    home = {
      pointerCursor = {
        gtk.enable = true;
        name = "Bibata-Original-Classic";
        package = pkgs.bibata-cursors;
        size = 24;
      };
    };
    
    gtk = {
      enable = true;
      theme = {
        name = "Andromeda";
        package = pkgs.andromeda-gtk-theme;
      };
      iconTheme = {
        name = "BeautyLine";
        package = pkgs.beauty-line-icon;
      };
    };
  };
}
