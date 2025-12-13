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
    lsfg-vk
    proton-pass
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
        enable = true;
      };
    };
    kernel =
    {
      lts = false;
    };
    software =
    {
      flatpak = false;
      virtualization = true;
    };
    system =
    {
      locale = "en_GB.UTF-8";
      timeZone = "Europe/Zurich";
    };
  };
}