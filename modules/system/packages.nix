{ pkgs, inputs, ... }:
{ 
  # list packages installed in system profile
  environment.systemPackages = with pkgs;
  [
  # terminal
    fish
    fastfetch
    git
    kitty
    terminator
  # hyprland addons
    dunst
    rofi-wayland
    networkmanagerapplet
    hyprnome
    nwg-look
    swww
    waybar
    ewww
  # DE tools 
    cinnamon.nemo-with-extensions
    gnome.gnome-system-monitor
    gnome.gnome-disk-utility
    gnome-text-editor
  # tools
    jstest-gtk
    mangohud
    goverlay
  # dependencies 
    libnotify  
  # gaming
    heroic
    prismlauncher
  # browsers
    firefox
    librewolf
  # wine proton manager
    bottles
    protonup-qt
  # overclocking
    corectrl
  # social
    discord
  # media
    moonlight-qt
    obs-studio
    vlc
    rhythmbox
  # icons
    bibata-cursors
    beauty-line-icon-theme
  # system
    andromeda-gtk-theme
  ];
  
  # custom fonts
  fonts.fontDir.enable = true;
  
  fonts.packages = with pkgs;
  [
    nerdfonts
    font-awesome
    google-fonts
  ];
}
