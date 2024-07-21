{pkgs, host, ...}:
let
  inherit (import ../../../hosts/${host}/hostSpecific/themingConfig.nix)
    fontPackage;
in
{
  fonts.enableDefaultPackages = true;
  fonts.packages =
  [
    pkgs."${fontPackage}"
    pkgs.noto-fonts
    pkgs.noto-fonts-cjk
  ];
}