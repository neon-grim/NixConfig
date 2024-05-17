{ pkgs, config, ... }:
{
  imports = 
  [
    ./fonts.nix
    ./kernel.nix
    ./packages.nix
    ./security.nix
    ./services.nix
    ./steam.nix
  ];
}
