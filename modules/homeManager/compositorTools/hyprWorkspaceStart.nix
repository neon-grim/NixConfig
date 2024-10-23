{pkgs, lib, inputs, config, ...}:
let
  hyprctl = lib.getExe' inputs.hyprland.packages.x86_64-linux.hyprland "hyprctl";
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