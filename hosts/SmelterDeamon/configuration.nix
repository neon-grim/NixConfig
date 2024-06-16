{config, pkgs, inputs, host, ...}:
let
  inherit (import ./variables.nix)
    layout
    variant
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
  # Time and language
  time.timeZone = "${systemTimeZone}";
  i18n.defaultLocale = "${systemLanguage}";
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
