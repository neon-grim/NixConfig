{pkgs, ...}:
{
  environment.sessionVariables =
  {
    MUTTER_DEBUG_FORCE_KMS_MODE="simple";
  };
  environment.systemPackages = with pkgs;
  [
    gnome-tweaks
    gnome-extension-manager
    gnomeExtensions.user-themes
    gnomeExtensions.tray-icons-reloaded
    gnomeExtensions.vitals
  ];
  services.xserver.desktopManager.gnome =
  {
    enable = true;
    extraGSettingsOverridePackages = [pkgs.gnome.mutter];
    extraGSettingsOverrides =
    ''
    [org.gnome.mutter]
    experimental-features=['variable-refresh-rate', 'scale-monitor-framebuffer']
    '';
  };
}
