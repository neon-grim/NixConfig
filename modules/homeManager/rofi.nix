{pkgs, host, ...}:
let
  inherit (import ../../hosts/${host}/variables.ni
    font
    fontSize;
in
{
  programs.rofi =
  {
    enable = true;
    cycle = true;
    font = "${font} ${toString fontSize}";
    terminal = "${pkgs.terminator}/bin/terminator";
  };
}