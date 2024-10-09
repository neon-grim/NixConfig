{pkgs, config, lib, ...}:
{
  config = lib.mkIf (config.desktop.software.flatpak)
  {
    services.flatpak.enable = true;
    systemd.services.flatpak-repo =
    {
      wantedBy = [ "multi-user.target" ];
      path = [ pkgs.flatpak ];
      script = 
      ''
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
      '';
    };
    environment.systemPackages =
    [
      pkgs.gnome-software
    ];
  };
}