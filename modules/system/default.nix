{ pkgs, config, ... }:
{
  imports = 
  [
    ./boot.nix
    ./displayManager.nix
    ./kernel.nix
    ./packages.nix
    ./security.nix
    ./services.nix
    ./steam.nix
  ];
}
