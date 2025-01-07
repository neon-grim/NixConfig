{pkgs, ...}:
{
  fonts.enableDefaultPackages = true;
  fonts.packages =
  [
    pkgs.noto-fonts
    pkgs.noto-fonts-cjk-sans
  ];
}