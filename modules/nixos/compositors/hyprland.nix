{pkgs, inputs, ...}:
{
  imports =
  [
    ./hyprland/hyprlandInput.nix
  ];
  environment.systemPackages = with pkgs;
  [
    hyprnome
    hyprshot
  ];
  programs.hyprland =
  {
    enable = true;
  };
}