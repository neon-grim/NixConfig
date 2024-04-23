{config, pkgs, ... }:
{
  # theming packages
  environment.systemPackages = with pkgs;
  [
  # icons
    bibata-cursors
    beauty-line-icon-theme
  # system
    andromeda-gtk-theme
  ];

  # custom fonts
  fonts.fontDir.enable = true;
  
  fonts.packages = with pkgs;
  [
    nerdfonts
    font-awesome
    google-fonts
  ];
}
