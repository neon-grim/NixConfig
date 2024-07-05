{pkgs, host, ...}:
let
  inherit (import ../../../hosts/${host}/hostSpecific/themingConfig.nix)
    cursorSize;
in
{
  services = 
  {
    xserver =
    {
      displayManager.gdm.enable = true;
      desktopManager.gnome = 
      {
        enable = true;
        extraGSettingsOverridePackages = [pkgs.gnome.mutter];
        extraGSettingsOverrides = 
        ''
        [org.gnome.mutter]
        experimental-features=['variable-refresh-rate', 'scale-monitor-framebuffer']
        '';
      };
    };
  };
  programs =
  {
    dconf.enable = true;
  };
  environment.systemPackages = with pkgs;
  [
    dconf-editor
    gnome-tweaks
    gnome-extension-manager
    gnomeExtensions.user-themes
    gnomeExtensions.vitals
  ];
}
