{pkgs, lib, ...}:
let
  makoCtl = lib.getExe' pkgs.mako "makoctl";
in
{
  home.packages = with pkgs;
  [(
    writeShellScriptBin  "makoCheckMode"
    ''
      makoMode=$(${makoCtl} mode | grep "dnd")
      result=""
      
      if [[ -n $makoMode ]]
      then
        result="dnd"
      else
        result="active"
      fi
      
      echo "{ \"alt\": \"$result\" }"
    ''
  )];
}