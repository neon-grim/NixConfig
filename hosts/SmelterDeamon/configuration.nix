{config, pkgs, inputs, host, compositor, lib, ...}:
{
  imports =
  [
    ./hardware-configuration.nix
    ./hostSpecific/storageConfig.nix
    ./hostSpecific/userConfig.nix
    ./../../modules/nixos/default.nix
  ] ++
  (
    if (compositor == "hyprland")
    then [./../../modules/nixos/hyprland.nix]
    else [./../../modules/nixos/gnome.nix]
  );
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
