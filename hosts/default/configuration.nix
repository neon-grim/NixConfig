{ config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./storage-config.nix
      ./../../modules/system/default.nix
      ./../../modules/homeManager/default.nix
    ];

  # define your hostname.
  networking.hostName = "SmelterDeamon";
  
  # allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # configure console keymap
  console.keyMap = "sg";

  # enable networking
  networking.networkmanager.enable = true;

  # set your time zone.
  time.timeZone = "Europe/Zurich";

  # select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  # nixos release
  system.stateVersion = "23.11";

  # enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
}
