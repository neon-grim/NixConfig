{pkgs, config, ...}:
let
  fontName = config.desktop.style.font.name;
  fontSize = config.desktop.style.font.size;
  fontPackage = config.desktop.style.font.package;
  themeName = config.theming.gtk.name;
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
      name = themeName;
      package = pkgs.${themePackage};
    };
    iconTheme =
    {
      name = "Dracula";
      package = pkgs.dracula-icon-theme;
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
      package = fontPackage;
    };
  };
}
