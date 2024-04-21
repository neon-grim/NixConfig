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
    hyprnome
  # DE Tools
    polkit_gnome
    cinnamon.nemo-with-extensions
    swww
  ];

  # enable polkit
  # todo: move polkit to different file
  security.polkit.enable = true;

  systemd = 
  {
    user.services.polkit-gnome-authentication-agent-1 = 
    {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = 
      { 
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

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
