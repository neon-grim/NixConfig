{ pkgs, ... }:
{
  # allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # allow steam
  programs.steam.enable = true;

  # allow gamemode
  programs.gamemode.enable = true;

  # allow blueman
  services.blueman.enable = true; 

  # list packages installed in system profile
  environment.systemPackages = with pkgs; 
  [
  # terminal
    fish
    fastfetch
    vim
    git
  # gaming
    heroic
    jstest-gtk
    protonup-qt
    goverlay
    mangohud
    prismlauncher
  # tools
    firefox
    librewolf
    bottles
    corectrl
  # social
    discord
  # media
    moonlight-qt
    obs-studio
    vlc
  # office
    onlyoffice-bin
  ];
}
