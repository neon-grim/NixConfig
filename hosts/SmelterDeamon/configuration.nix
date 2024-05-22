{config, pkgs, inputs, host, ...}:
let
  inherit (import ./variables.nix)
    systemTimeZone
    systemLanguage;
in
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
    hostName = "${host}";
    networkmanager.enable = true;
  };
  # set your time zone.
  time.timeZone = "${systemTimeZone}";
  # select internationalisation properties.
  i18n.defaultLocale = "${systemLanguage}";
  # nixos release
  system.stateVersion = "23.11";
  # enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
