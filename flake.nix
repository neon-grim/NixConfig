{
  description = "NeonGrim NixOS flake";
  
  inputs =
  {
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland";
    lact.url = "github:cything/nixpkgs?ref=lact";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  
  outputs = inputs@{self, nixpkgs, home-manager, chaotic, ...}:
  {
    nixosConfigurations =
    let
      compositor = "hyprland";
      host = "SmelterDeamon";
      user = "ashen_one";
    in
    {
      "${host}" = nixpkgs.lib.nixosSystem
      {
        system = "x86_64-linux";
        specialArgs =
        {
          inherit compositor;
          inherit host;
          inherit inputs;
          inherit user;
        };
        modules =
        [
          ./hosts/${host}/config.nix
          ./modules/nixos/default.nix
          chaotic.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager =
            {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${user}.imports =
              [
                ./hosts/${host}/home.nix
                ./modules/homeManager/default.nix
              ];
              extraSpecialArgs =
              {
                inherit compositor;
                inherit host;
                inherit inputs;
                inherit user;
              };
            };
          }
        ];
      };
    };
  };
}
