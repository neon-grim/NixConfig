{pkgs, ...}:
{ 
  environment.systemPackages = with pkgs;
  [
    # TTY Tools
    calcure
    git
    fastfetch
    lazygit
    nnn
    nix-prefetch-git
    psmisc
    terminator
    usbutils
    # WM Tools
    networkmanagerapplet
    wofi
    wlogout
    swaynotificationcenter
    waybar
    # Hyprland Tools
    hyprland-workspaces
    hyprland-protocols
    hyprnome
    hyprpaper
    hyprshot
    # UI Tools
    gparted
    pavucontrol
    onlyoffice-bin_latest
    # XFCE Tools
    xfce.mousepad
    xfce.orage
    xfce.ristretto
    xfce.xfce4-taskmanager
    # Gnome Tools
    gnome.file-roller
    gnome.gnome-software
    # Gaming Tools
    goverlay
    jstest-gtk
    libstrangle
    mangohud
    scanmem
    vkbasalt
    # Dependencies 
    libnotify
    spice-gtk
    xdg-user-dirs
    xdg-utils
    # Launchers
    heroic
    prismlauncher
    # Wine Proton Client
    bottles
    protonplus
    # Overclocking
    corectrl
    # Social
    vesktop
    discord
    # Media
    cava
    gimp
    libsForQt5.kdenlive
    moonlight-qt
    obs-studio
    rhythmbox
    vlc
  ];
}
