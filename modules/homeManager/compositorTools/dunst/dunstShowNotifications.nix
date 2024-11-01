{pkgs, lib, ...}:
let
  dunstCtl = lib.getExe' pkgs.dunst "dunstctl";
in
{
  home.packages = with pkgs;
  [(
    writeShellScriptBin "dunstShowNotifications"
    ''
      activeCount=$(${dunstCtl} count displayed)
      
      if [[ $activeCount -gt 0 ]]
      then
        echo "closing notifications"
        ${dunstCtl} close-all
        exit 0
      fi
      
      repeat=$(${dunstCtl} count history)
      
      for (( i=0; i<repeat && i<5 ; i++ ))
      do
        echo $i "out of " $repeat
        ${dunstCtl} history-pop
      done
    ''
  )];
}