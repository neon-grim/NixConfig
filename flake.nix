{
  description = "SmelterDeamon NixOS flake";

  inputs = 
  {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = 
    {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
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
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.ashen_one = import ./hosts/default/home.nix;
            home-manager.extraSpecialArgs = {inherit inputs;};
          }
        ];
      };
    };
  };
}
