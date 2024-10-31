{pkgs, lib, ...}:
let
  dunstCtl = lib.getExe' pkgs.dunst "dunstctl";
in
{
  home.packages = with pkgs;
  [(
    writeShellScriptBin  "dunstCheckMode"
    ''
      result=""
      paused=$(${dunstCtl} is-paused)
      
      if $paused
      then
        result="dnd"
      else
        result="active"
      fi
      
      echo "{ \"alt\": \"$result\" }"
    ''
  )];
}