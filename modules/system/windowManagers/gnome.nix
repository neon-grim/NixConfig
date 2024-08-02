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
  environment.systemPackages = with pkgs;
  [
    gnome-tweaks
    gnome-extension-manager
    gnomeExtensions.user-themes
    gnomeExtensions.vitals
  ];
  environment.sessionVariables =
  {
    MUTTER_DEBUG_FORCE_KMS_MODE="simple";
  };
}
