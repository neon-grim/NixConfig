{pkgs, inputs, ...}:
{
  imports =
  [
    inputs.hyprland.nixosModules.default
  ];
  environment.systemPackages = with pkgs;
  [
    greetd.tuigreet
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
  services.greetd =
  {
    enable = true;
    settings =
    {
      default_session =
      {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "${user}";
      };
    };
  };
}