{...}:
{
  imports =
  [
    #./hardware/amdvlk.nix
    ./hardware/bluetooth.nix
    ./hardware/kernel.nix
    ./hardware/printing.nix
    ./hardware/sound.nix
    ./software/fonts.nix
    ./software/gaming.nix
    ./software/generalSoftware.nix
    ./software/virtualisation.nix
    ./software/terminal.nix
    ./system/defaultEnvVar.nix
    ./system/security.nix
    ./system/users.nix
  ];
}
