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
  environment.sessionVariables =
  {
    # General system variables
    NIXOS_OZONE_WL = 1;
    XCURSOR_SIZE = cursorSize;
    # User dirs
    XDG_DESKTOP_DIR= "$HOME/Desktop";
    XDG_DOCUMENTS_DIR= "$HOME/Documents";
    XDG_DOWNLOAD_DIR= "$HOME/Downloads";
    XDG_MUSIC_DIR= "$HOME/Music";
    XDG_PICTURES_DIR= "$HOME/Pictures";
    XDG_PUBLICSHARE_DIR= "$HOME/Public";
    XDG_TEMPLATES_DIR= "$HOME/Templates";
    XDG_VIDEOS_DIR= "$HOME/Videos";
    # Config dirs
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
  };
}
