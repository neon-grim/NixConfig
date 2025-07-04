{pkgs, inputs, user, ...}:
{
  imports =
  [
    ./hyprland/hyprlandInput.nix
  ];
  environment.systemPackages = with pkgs;
  [
    greetd.tuigreet
    hyprnome
    hyprshot
  ];
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