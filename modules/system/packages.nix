{pkgs, ...}:
{ 
  environment.systemPackages = with pkgs;
  [
    # Terminal And Shell
    fish
    terminator
    # TUI Tools
    calcure
    fastfetch
    git
    neovim
    nnn
    nix-prefetch-git
    # Thirparty Tools
    networkmanagerapplet
    nwg-bar
    rofi-wayland
    swaynotificationcenter
    # Hyprland Tools
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
    # Gaming Tools
    goverlay
    jstest-gtk
    mangohud
    vkbasalt
    libstrangle
    # Dependencies 
    libnotify
    libz  
    spice-gtk
    python310
    # Launchers
    heroic
    prismlauncher
    # Browsers
    firefox
    # Wine Proton Client
    bottles
    protonup-qt
    # Overclocking
    corectrl
    # Social
    vesktop
    # Media
    moonlight-qt
    obs-studio
    rhythmbox
    vlc
  ];
}
