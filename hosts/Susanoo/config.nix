{config, pkgs, ...}:
{
  imports =
  [
    ./hostSpecific/nixos/hardware-configuration.nix
    ./hostSpecific/nixos/storageConfig.nix
    ./hostSpecific/nixos/userConfig.nix
  ];
  environment.systemPackages = with pkgs;
  [
    edopro
  ];
  desktop =
  {
    drivers =
    {
      amd =
      {
        enable = true;
      };
      printing =
      {
        enable = false;
      };
    };
    kernel =
    {
      lts = false;
    };
    software =
    {
      flatpak = false;
      virtualization = false;
    };
    system =
    {
      locale = "en_GB.UTF-8";
      timeZone = "Europe/Zurich";
    };
  };