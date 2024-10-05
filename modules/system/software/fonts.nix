{pkgs, ...}:
{
  fonts.enableDefaultPackages = true;
  fonts.packages =
  [
    pkgs.nerdfonts
    pkgs.noto-fonts
    pkgs.noto-fonts-cjk
  ];
}