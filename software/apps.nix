{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # Allow steam
  programs.steam.enable = true;

  # Allow gamemode
  programs.gamemode.enable = true; 

  # List packages installed in system profile
  environment.systemPackages = with pkgs; [
  #  Gnome
    gnomeExtensions.vitals
    nautilus-open-any-terminal
  #  Terminal
    fish
    terminator
    fastfetch
    vim
  #  Gaming
    heroic
    jstest-gtk
    protonup-qt
    goverlay
    mangohud
    prismlauncher
  #  Tools
    bottles
    corectrl
    git
  #  Social
    discord
  #  media
    moonlight-qt
    obs-studio
    vlc
  #  office
    onlyoffice-bin
  ];
}
