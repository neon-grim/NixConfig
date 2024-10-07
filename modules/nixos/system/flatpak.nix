{pkgs, config, lib, ...}:
let
  flatpakEnabled = config.desktop.software.flatpak;
in
{
  services.flatpak.enable = flatpakEnabled;
  systemd.services.flatpak-repo = lib.mkIf (flatpakEnabled)
  {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = 
    ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };
  environment.systemPackages = lib.mkIf (flatpakEnabled)
  [
    pkgs.gnome-software
  ];
}