{config, pkgs, ... }: 
{
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  
  # Enable GNOME Display Manager
  services.xserver.displayManager.gdm.enable = true;
  
  # Enable Hyprland Window Manager
  programs.hyprland.enable = true;
  
  # Allow Dconf
  programs.dconf.enable = true; 
 
  # Enable XDG Portals
  xdg.autostart.enable = true;
  xdg.portal = 
  {
    enable = true;
    extraPortals = with pkgs;
    [
      xdg-desktop-portal 
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };

  # hyprland specific software
  environment.systemPackages = with pkgs; 
  [
  # terminal
    kitty
  # hyprland addons
    dunst
    waybar
    rofi-wayland
    networkmanagerapplet
    hyprnome
    nwg-look
    swww
  # DE tools 
    cinnamon.nemo-with-extensions
    gnome.gnome-system-monitor
    gnome.gnome-disk-utility
    gnome-text-editor
  # dependencies 
    libnotify  
  ];

  # overlay for waybar
  # todo: Learn what overlays are
  nixpkgs.overlays = 
  [(
    self: super:
    {
      waybar = super.waybar.overrideAttrs (oldAttrs: { mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"]; });
    }
  )];
}
