{pkgs, lib, ...}:
let
  makoCtl = lib.getExe' pkgs.mako "makoctl";
in
{
  home.packages = with pkgs;
  [(
    writeShellScriptBin "makoShowNotifications"
    ''
      listOutput=$(${makoCtl} list | grep -Po '\[{.*}]')
      
      if [[ -n $listOutput ]]
      then
        echo "closing notifications"
        ${makoCtl} dismiss -a
        exit 0
      fi
      
      repeat=$(${makoCtl} history | grep -Po '{.*?}}[,|\]]' | wc -l)
      
      for (( i=0; i<repeat; i++ ))
      do
        ${makoCtl} restore
        echo $i "out of " $repeat
      done
    ''
  )];
}