{pkgs, ...}:
{
  environment.systemPackages = with pkgs;
  [
    hyprland-workspaces
    hyprland-protocols
    hyprnome
    hyprshot
  ];
  programs.hyprland =
  {
    enable = true;
  };
}