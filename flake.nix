{
  description = "SmelterDeamon NixOS flake";

  inputs = 
  {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
  let
    lib = nixpkgs.lib;
  in
  {
    nixosConfigurations = 
    {
      SmelterDeamon = lib.nixosSystem 
      {
        system = "x86_64-linux";
        modules = [ ./hosts/default/configuration.nix ];
      };
    };
  };
}
