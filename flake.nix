{
  description = "SmelterDeamon NixOS flake";

  inputs = 
  {
    nixpkgs.url = github:nixos/nixpkgs/nixos-unstable;
    home-manager = 
    {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, hyprland, ... }:
  let
    lib = nixpkgs.lib;
    host = "SmelterDeamon";
    username = "ashen_one";
  in
  {
    nixosConfigurations = 
    {
      "${host}" = lib.nixosSystem 
      {
        system = "x86_64-linux";
        specialArgs = 
        {
          inherit inputs;
          inherit username;
          inherit host;
        };
        modules = 
        [ 
          ./hosts/${host}/configuration.nix
          hyprland.nixosModules.default
          {
            programs.hyprland.enable = true; 
          }
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username} = import ./hosts/${host}/home.nix;
            home-manager.extraSpecialArgs = 
            {
              inherit inputs;
              inherit username;
              inherit host;
            };
          }
        ];
      };
    };
  };
}
