{config, pkgs, inputs, host, compositor, ...}:
{
  imports =
  [
    ./hardware-configuration.nix
    ./hostSpecific/storageConfig.nix
    ./hostSpecific/userConfig.nix
    ./../../modules/nixos/default.nix
    ./../../modules/nixos/${compositor}.nix
  ];
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  i18n.defaultLocale = "en_GB.UTF-8";
  time.timeZone = "Europe/Zurich";
  system.stateVersion = "23.11";
}
