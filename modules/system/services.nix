{ pkgs, config, lib, inputs, ... }:
{
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  
  # bluetooth services
  services.blueman.enable = true; 
  
  # storage services
  services.devmon.enable = true;
  services.gvfs.enable = true; 
  services.udisks2.enable = true;
  services.fstrim.enable = true;
  
  # remote services
  services.openssh.enable = true;
  
  # enable CUPS to print documents.
  services.printing.enable = true;
  
  # configure keymap in X11
  services.xserver.xkb = 
  {
    layout = "ch";
    variant = "de_nodeadkeys";
  };
  
  # Enable Hyprland Window Manager
  programs.hyprland = {
      enable = true;
      #package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };
  
  programs.gamemode.enable = true;
  programs.dconf.enable = true;
  
  # Enable XDG Portals
  xdg = 
  {
    autostart.enable = true;
    portal = 
    {
      enable = true;
      extraPortals = with pkgs;
      [ 
        xdg-desktop-portal-gtk
        xdg-desktop-portal-hyprland
      ];
    };
  };
  
  # sound services
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = 
  {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
