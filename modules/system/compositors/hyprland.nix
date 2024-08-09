{pkgs, inputs, ...}:
{
  programs.hyprland = 
  {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  };
  environment.systemPackages = with pkgs;
  [
    hyprland-workspaces
    hyprland-protocols
    hyprnome
    hyprshot
    # hyprpaper
  ];
}