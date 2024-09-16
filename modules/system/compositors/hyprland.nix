{pkgs, inputs, ...}:
{
  imports =
  [
    inputs.hyprland.nixosModules.default
  ];
  programs.hyprland =
  {
    enable = true;
  };
  environment.systemPackages = with pkgs;
  [
    hyprland-workspaces
    hyprland-protocols
    hyprnome
    hyprshot
  ];
}