{
  description = "SmelterDeamon NixOS flake";

  inputs = 
  {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
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
