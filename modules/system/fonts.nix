{pkgs, ...}:
{
  fonts.enableDefaultPackages = true;
  fonts.packages = with pkgs; 
  [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    nerdfonts
    font-awesome
    google-fonts
    twemoji-color-font
    fira-code
    fira-code-symbols
  ];
}