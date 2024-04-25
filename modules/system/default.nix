{ pkgs, config, ... }:
{
  imports = 
  [
    ./boot.nix
    ./displayManager.nix
    ./kernel.nix
    ./security.nix
    ./services.nix
    ./steam.nix
  ];
}
