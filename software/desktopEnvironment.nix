{config, pkgs, ... }: 
{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  # Enable KDE Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.desktopManager.plasma6.enable = true;

  # Enable Hyprland Window Manager
  programs.hyprland.enable = true;
}
