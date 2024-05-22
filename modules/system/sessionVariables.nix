{host, ...}:
let
  inherit (import ../../hosts/${host}/variables.nix)
    cursorSize
    cursorTheme;
in
{
  environment.sessionVariables = 
  {
    NIXOS_OZONE_WL = "1";
    XCURSOR_SIZE = "${cursorSize}";
  };
}