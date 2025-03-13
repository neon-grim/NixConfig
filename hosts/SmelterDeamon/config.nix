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
    amd =
    {
      enable = true;
      amdvlk = false;
      mesaGit = false;
    };
    kernel =
    {
      name = "cachyos";
    };
    printing =
    {
      enable = true;
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
