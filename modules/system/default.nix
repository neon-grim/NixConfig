{ pkgs, config, ... }:
{
  imports = 
  [
    ./flatpak.nix
    ./fonts.nix
    ./kernel.nix
    ./packages.nix
    ./security.nix
    ./services.nix
    ./sessionVariables.nix
    ./steam.nix
  ];
}
