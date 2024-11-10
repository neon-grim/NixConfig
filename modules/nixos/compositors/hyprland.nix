{pkgs, inputs, ...}:
{
  imports =
  [
    inputs.hyprland.nixosModules.default
  ];
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