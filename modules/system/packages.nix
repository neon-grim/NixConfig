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
    swww
    waybar
  # DE tools 
    cinnamon.nemo-with-extensions
    gnome.nautilus
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
  ];
}
