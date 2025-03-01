{host, config, inputs, ...}:
let
  locale = config.desktop.system.locale;
  time = config.desktop.system.timeZone;
in
{
  imports =
  [
    inputs.chaotic.nixosModules.default
    ./commonModules/commonServices.nix
    ./commonModules/keyboarConfig.nix
  ];
  console =
  {
    keyMap = "sg";
  };
  networking =
  {
    hostName = "${host}";
    networkmanager.enable = true;
  };
  nix =
  {
    settings.experimental-features = [ "nix-command" "flakes" ];
  };
  nixpkgs =
  {
    config.allowUnfree = true;
  };
  system =
  {
    stateVersion = "23.11";
  };
  i18n =
  {
    defaultLocale = locale;
  };
  time =
  {
    timeZone = time;
  };
}