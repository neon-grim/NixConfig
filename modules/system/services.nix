{ pkgs, config, lib, inputs, ... }:
{
  # hardware settings
  hardware = 
  {
    pulseaudio.enable = false;
    bluetooth = 
    {
      enable = true;
      powerOnBoot = true;
    };
  };
  
  sound.enable = true;
  
  # enable services
  services = 
  {
    # enable pipewire
    pipewire = 
    { 
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
    
    # setup revelant xservices
    xserver =
    {
      enable = true;
      displayManager.gdm.enable = true;
      xkb = 
      {
        layout = "ch";
        variant = "de_nodeadkeys";
      };
    };
    
    # bluetooth service
    blueman.enable = true; 
  
    # storage services
    devmon.enable = true;
    gvfs.enable = true; 
    udisks2.enable = true;
    fstrim.enable = true;
  
    # remote services
    openssh.enable = true;
  
    # enable CUPS to print documents.
    printing.enable = true;
  };
  
  # enable virtualisation
  virtualisation.libvirtd.enable = true;

  # enable vital programs
  programs = 
  {
    hyprland.enable = true;
    gamemode.enable = true;
    dconf.enable = true;
    virt-manager.enable = true;
  };
  
  # Enable XDG Portals
  xdg.portal = 
  {
    enable = true;
    extraPortals = 
    [ 
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal
    ];
    configPackages = 
    [ 
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal
    ];
  };
}
