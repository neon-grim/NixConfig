{pkgs, inputs, user, ...}:
{
  imports =
  [
    ./hyprland/hyprlandInput.nix
  ];
  environment.systemPackages = with pkgs;
  [
    tuigreet
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
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "${user}";
      };
    };
  };
  xdg.portal =
  {
    enable = true;
    extraPortals = 
    [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}