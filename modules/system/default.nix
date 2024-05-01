{ pkgs, config, ... }:
{
  imports = 
  [
    ./kernel.nix
    ./packages.nix
    ./security.nix
    ./services.nix
    ./steam.nix
  ];
}
