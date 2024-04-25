{ pkgs, ... }:
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
