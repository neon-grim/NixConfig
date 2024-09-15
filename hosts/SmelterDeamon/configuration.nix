{config, pkgs, inputs, host, windowManager, ...}:
{
  imports =
  [
    ./hardware-configuration.nix
    ./hostSpecific/storageConfig.nix
    ./../../modules/system/default.nix
    ./../../modules/system/${windowManager}.nix
  ];
  console.keyMap = "sg";
  i18n.defaultLocale = "en_GB.UTF-8";
  time.timeZone = "Europe/Zurich";
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "23.11";
}
