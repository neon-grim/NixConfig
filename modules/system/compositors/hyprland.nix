{pkgs, ...}:
{
  programs.hyprland.enable = true;
  environment.systemPackages = with pkgs;
  [
    hyprland-workspaces
    hyprland-protocols
    hyprnome
    hyprshot
    # hyprpaper
  ];
}