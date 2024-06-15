{pkgs, ...}:
{
  fonts.enableDefaultPackages = true;
  fonts.packages = with pkgs; 
  [
    jetbrains-mono
    nerdfonts
    noto-fonts
    noto-fonts-cjk
  ];
}