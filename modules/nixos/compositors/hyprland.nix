{pkgs, inputs, lib, config, user, ...}:
{
  imports =
  [
    ./hyprland/hyprlandInput.nix
  ];
  config = lib.mkIf (config.home-manager.users.${user}.desktop.system.compositors.hyprland.enable)
  {
    environment.systemPackages = with pkgs;
    [
      hyprnome
      hyprshot
    ];
    programs.hyprland =
    {
      enable = true;
    };
  };
}