{ pkgs, inputs, ... }:
{ 
  # list packages installed in system profile
  environment.systemPackages = with pkgs;
  [
  # terminal
    fish
    fastfetch
    git
    terminator
  # hyprland addons
    dunst
    hyprnome
    hyprshot
    hyprpaper
    hyprland-workspaces
    networkmanagerapplet
    rofi-wayland
    wlogout
  # DE tools 
    cinnamon.nemo-with-extensions
    gnome.gnome-system-monitor
    gnome.gnome-disk-utility
    gnome-text-editor
    gnome.gnome-tweaks
    pavucontrol
  # tools
    goverlay
    jstest-gtk
    mangohud
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
