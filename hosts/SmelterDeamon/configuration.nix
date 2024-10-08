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
  
  desktop =
  {
    drivers =
    {
      amd =
      {
        enable = true;
        amdvlk = true;
      };
      printing = true;
    };
    software =
    {
      flatpak = true;
      virtualization = true;
    };
    system =
    {
      locale = "en_GB.UTF-8";
      timeZone = "Europe/Zurich";
    };
  };
}
