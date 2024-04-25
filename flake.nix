{
  description = "SmelterDeamon NixOS flake";

  inputs = 
  {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    home-manager = 
    {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    lib = nixpkgs.lib;
  in
  {
    nixosConfigurations = 
    {
      SmelterDeamon = lib.nixosSystem 
      {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = 
        [ 
          ./hosts/default/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    };
  };
}
