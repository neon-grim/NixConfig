{ pkgs, inputs, ... }:
{ 
  # apps
  environment.systemPackages = with pkgs;
  [
    # Terminal
    fish
    terminator
    # TUI Tools
    calcure
    fastfetch
    git
    neovim
    nnn
    nix-prefetch-git
    # addons
    networkmanagerapplet
    nwg-bar
    rofi-wayland
    swaynotificationcenter
    # hyprland tools
    hyprland-workspaces
    hyprland-protocols
    hyprnome
    hyprpaper
    hyprshot
    # UI Tools
    gparted
    pavucontrol
    xfce.mousepad
    xfce.orage
    xfce.ristretto
    xfce.thunar
    xfce.thunar-volman
    xfce.tumbler
    xfce.xfce4-taskmanager
    # Todo: Replace these two
    gnome.gnome-software
    gnome.gnome-tweaks
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
  fonts.enableDefaultPackages = true;
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
