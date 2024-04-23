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
    git
  # text editors
    neovim
    onlyoffice-bin
  # gaming
    heroic
    prismlauncher
  # tools
    jstest-gtk
    mangohud
    goverlay
  # browsers
    firefox
    librewolf
  # wine proton manager
    bottles
    proton-qt
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
}
