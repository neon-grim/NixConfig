{pkgs, config, ...}:
let
  fontName = config.desktop.style.font.name;
  fontSize = config.desktop.style.font.size;
  themePackage = config.theming.gtk.package;
in
{
  imports = 
  [
    ./presets/andromeda.nix
    ./presets/adwaitaDark.nix
    ./presets/kanagawa.nix
  ];
  
  gtk =
  {
    enable = true;
    theme =
    {
      package = pkgs.${themePackage};
      name = config.theming.gtk.name;
    };
    iconTheme =
    {
      package = pkgs.beauty-line-icon-theme;
      name = "BeautyLine";
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
      name = fontName;
      size = fontSize;
    };
  };
}
