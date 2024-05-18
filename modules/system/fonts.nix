{pkgs, ...}:
{
  fonts.enableDefaultPackages = true;
  fonts.packages = with pkgs; 
  [
    dina-font
    fira-code
    fira-code-symbols
    font-awesome
    google-fonts
    liberation_ttf
    nerdfonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    twemoji-color-font
  ];
}