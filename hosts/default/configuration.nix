{ config, pkgs, inputs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./storage-config.nix
      ./../../modules/system/default.nix
    ];
  
  # allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # configure console keymap
  console.keyMap = "sg";

  # enable networking
  networking = 
  {
    hostName = "SmelterDeamon";
    networkmanager.enable = true;
  };
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ashen_one = {
    isNormalUser = true;
    description = "Michael Mueller de los Santos";
    extraGroups = [ "networkmanager" "wheel" "libvirt" ];
    packages = with pkgs; [ ];
  };
  
  # set your time zone.
  time.timeZone = "Europe/Zurich";

  # select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  # nixos release
  system.stateVersion = "23.11";

  # enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
}
