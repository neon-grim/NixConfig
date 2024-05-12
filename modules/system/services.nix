{ pkgs, config, lib, inputs, ... }:
{
  #hardware settings
  sound.enable = true;
  hardware = 
  {
    pulseaudio.enable = false;
    xone.enable = true;
    bluetooth = 
    {
      enable = true;
      powerOnBoot = true;
    };
  };
  # Service settings
  services = 
  {
    # audio service
    pipewire = 
    { 
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
    # xservices settings
    xserver =
    {
      enable = true;
      xkb = 
      {
        layout = "ch";
        variant = "de_nodeadkeys";
      };
    };    
    # display manager
    greetd = 
    {
      enable = true;
      settings = {
        default_session = 
        {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
          user = "ashen_one";
        };
      };
    };
    # storage services
    devmon.enable = true;
    gvfs.enable = true; 
    fstrim.enable = true;
    udisks2.enable = true;
    # printing settings
    printing.enable = true;
    avahi = 
    {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    # other services
    blueman.enable = true; 
    flatpak.enable = true;
    openssh.enable = true;
    dbus.enable = true;  
  };
  # enable virtualisation
  virtualisation.libvirtd.enable = true;
  # enable vital programs
  programs = 
  {
    gamemode.enable = true;
    dconf.enable = true;
    virt-manager.enable = true;
    hyprland = 
    {
      enable = true;
    };
  };
  # Enable XDG Portals
  xdg.portal = 
  {
    enable = true;
    wlr.enable = true;
    extraPortals = 
    [ 
      pkgs.xdg-desktop-portal-gtk
    ];
  };
  # flatpak settings
  systemd.services.flatpak-repo = 
  {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = 
    ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };
  environment.sessionVariables = 
  {
    # Hint Electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };
}
