{pkgs, ...}:
{ 
  environment.systemPackages = with pkgs;
  [
    # TTY Tools
    calcure
    gifsicle
    git
    gping
    fastfetch
    ffmpeg_7-full
    lazygit
    neovim
    nnn
    nix-prefetch-git
    psmisc
    terminator
    viu
    usbutils
    # Thirparty Tools
    networkmanagerapplet
    rofi-bluetooth
    rofi-file-browser
    rofi-power-menu
    rofi-pulse-select
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
    xfce.xfce4-taskmanager
    gnome.file-roller
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
    xdg-user-dirs
    xdg-utils
    # Launchers
    heroic
    prismlauncher
    # Wine Proton Client
    bottles
    protonup-qt
    # Overclocking
    corectrl
    # Social
    vesktop
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
