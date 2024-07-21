{config, pkgs, inputs, host, windowManager, ...}:
let
  inherit (import ./hostSpecific/systemConfig.nix)
    layout
    variant;
in
{
  imports =
  [
    ./hardware-configuration.nix
    ./hostSpecific/storageConfig.nix
    ./../../modules/system/default.nix
    ./../../modules/system/${windowManager}.nix
  ];
  # Time and language
  time.timeZone = "Europe/Zurich";
  i18n.defaultLocale = "en_GB.UTF-8";
  # Package Config
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # System Release
  system.stateVersion = "23.11";
  # Swap
  zramSwap.enable = true;
  # Keyboard and general services
  console.keyMap = "sg";
  services =
  {
    dbus.enable = true;
    geoclue2.enable = true;
    xserver =
    {
      enable = true;
      xkb =
      {
        layout = "${layout}";
        variant = "${variant}";
      };
    };
  };
  # Host config
  networking = 
  {
    hostName = "${host}";
    networkmanager.enable = true;
  };
}
