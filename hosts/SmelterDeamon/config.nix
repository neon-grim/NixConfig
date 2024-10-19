{config, lib, compositor, ...}:
{
  imports =
  [
    ./../../modules/nixos/default.nix
    ./hostSpecific/nixos/hardware-configuration.nix
    ./hostSpecific/nixos/storageConfig.nix
    ./hostSpecific/nixos/userConfig.nix
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
