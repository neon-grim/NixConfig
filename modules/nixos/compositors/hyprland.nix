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
  nix.settings =
  {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
  programs.hyprland =
  {
    enable = true;
  };
}