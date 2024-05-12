{ pkgs, inputs, ... }:
{ 
  # apps
  environment.systemPackages = with pkgs;
  [
    # terminal
    fastfetch
    fish
    git
    nix-prefetch-git
    terminator
    # hyprland addons
    dunst
    networkmanagerapplet
    hyprnome
    hyprpaper
    hyprshot
    hyprland-workspaces
    rofi-wayland
    wlogout
    # DE tools 
    gnome.gnome-disk-utility
    gnome.nautilus
    gnome.gnome-system-monitor
    gnome.gnome-software
    gnome.gnome-tweaks
    gnome-text-editor
    pavucontrol
    # tools
    goverlay
    jstest-gtk
    mangohud
    vkbasalt
    libstrangle
    # dependencies 
    libnotify
    libz  
    spice-gtk
    python310
  # gaming
    heroic
    prismlauncher
    # browsers
    firefox
    # wine proton manager
    bottles
    protonup-qt
    # overclocking
    corectrl
    # social
    vesktop
    # media
    moonlight-qt
    obs-studio
    rhythmbox
    vlc
  ];
  #fonts.enableDefaultPackages = true;
  fonts.packages = with pkgs; 
  [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    nerdfonts
    font-awesome
    google-fonts
    twemoji-color-font
    fira-code
    fira-code-symbols
  ];  
}
