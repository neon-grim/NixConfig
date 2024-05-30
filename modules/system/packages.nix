{pkgs, ...}:
{ 
  environment.systemPackages = with pkgs;
  [
    # TTY Tools
    calcure
    gifsicle
    git
    fastfetch
    ffmpeg_7-full
    lazygit
    nnn
    nix-prefetch-git
    psmisc
    terminator
    usbutils
    # WM Tools
    networkmanagerapplet
    rofi-bluetooth
    rofi-file-browser
    rofi-power-menu
    rofi-pulse-select
    rofi-wayland
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
    # XFCE Tools
    xfce.mousepad
    xfce.orage
    xfce.ristretto
    xfce.xfce4-taskmanager
    # Gnome Tools
    gnome.file-roller
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
