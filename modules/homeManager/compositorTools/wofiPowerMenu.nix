{pkgs, ...}:
{
  home.packages = with pkgs; 
  [(
    writeShellScriptBin "wofiPowerMenu"
    ''
      entries="⇠ Logout\n⏾ Lock\n⭮ Reboot\n⏻ Shutdown"

      selected=$(echo -e $entries | wofi --width 250 --height 210 --dmenu | awk '{print tolower($2)}')

      case $selected in
        logout)
          niri msg action quit --skip-confirmation
          ;;
        lock)
          exec hyprlock
          ;;
        reboot)
          exec systemctl reboot
          ;;
        shutdown)
          exec systemctl poweroff -i
          ;;
      esac
    ''
  )];
}