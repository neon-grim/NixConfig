{pkgs, host, ...}:
let
  inherit (import ../../hosts/${host}/variables.nix)
    layout
    variant;
in
{
  
  # General
  zramSwap.enable = true;
  programs.dconf.enable = true;
  programs.fish.enable = true;
  services.dbus.enable = true;
  services.geoclue2.enable = true;
  services.openssh.enable = true;
  services.xserver.enable = true;
  # Storage
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.fstrim.enable = true;
  services.udisks2.enable = true;
  # Virtualization
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  # File Manager
  programs.thunar =
  {
    enable = true;
    plugins = with pkgs.xfce; 
    [ 
      thunar-archive-plugin
      thunar-media-tags-plugin
      thunar-volman
    ];
  };
  programs.xfconf.enable = true;
  services.tumbler.enable = true; 
  # Bluetooth
  services.blueman.enable = true;
  hardware.bluetooth =
  {
    enable = true;
    powerOnBoot = true;
  };
  # Audio
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
  # Keyboard
  services.xserver.xkb =
  {
    layout = "${layout}";
    variant = "${variant}";
  }; 
  # Printing
  services.printing.enable = true;
  services.avahi = 
  {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  }; 
  # XDG Portals
  xdg.portal =
  {
    enable = true;
    wlr.enable = true;
    extraPortals = 
    [ 
      pkgs.xdg-desktop-portal-gtk
    ];
  };
  # Window Manager
  programs.hyprland =
  {
    enable = true;
    xwayland.enable = true;
  };
  # Display Manager
  services.greetd =
  {
    enable = true;
    settings =
    {
      default_session = 
      {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "ashen_one";
      };
    };
  };
}
