{pkgs, ...}:
{
  programs =
  {
    dconf.enable = true;
    hyprland.enable = true;
    hyprlock.enable = true;
  };
  environment.systemPackages = with pkgs;
  [
    # Testing
    hyprland-activewindow
    hyprland-per-window-layout
    hyprland-autoname-workspaces
    hyprkeys
    # Hyprland Tools
    hyprland-workspaces
    hyprland-protocols
    hyprnome
    hyprpaper
    hyprpicker
    hyprshot
  ];
}