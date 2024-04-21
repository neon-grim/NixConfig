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
  xdg.portal = 
  {
    enable = true;
    extraPortals = with pkgs;
    [ 
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };
  
  #environment.systemPackages = [
  #  (pkgs.waybar.overrideAttrs (oldAttrs: {
  #    mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
  #    })
  #  )
  #];

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
    libnotify
  # DE Tools
    polkit_gnome
    cinnamon.nemo-with-extensions
    swww
  ];

  # custom fonts
  fonts.fontDir.enable = true;
  fonts.fonts = with pkgs;
  [
    nerdfonts
    font-awesome
    google-fonts
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
