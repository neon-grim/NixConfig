{pkgs, lib, config, ...}:
let
  hyprctl = lib.getExe' pkgs.hyprland "hyprctl";
  workspaceCount = config.desktop.system.workspaceCount;
in
{
  home.packages = with pkgs;
  [(
    writeShellScriptBin "hyprWorkspaceStart"
    ''
      command=""
      
      for ((i = ${workspaceCount}; i > 1; i--))
      do
        command+="dispatch workspace $i;"
      done
      
      ${hyprctl} --batch $command
    ''
  )];
}