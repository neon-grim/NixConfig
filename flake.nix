{
  description = "NeonGrim NixOS flake";
  
  inputs =
  {
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  
  outputs = inputs@{self, chaotic, nixpkgs, home-manager, ...}:
  let
    desktops =
    [ 
      { name = "SmelterDeamon"; user = "ashen_one"; }
    ];
  in
  {
    nixosConfigurations = nixpkgs.lib.listToAttrs (map (host: 
    {
      name = host.name;
      value = nixpkgs.lib.nixosSystem
      {
        system = "x86_64-linux";
        specialArgs =
        {
          host = host.name;
          user = host.user;
          inherit inputs;
        };
        modules =
        [
          chaotic.nixosModules.default
          ./hosts/${host.name}/config.nix
          ./modules/nixos/default.nix
          home-manager.nixosModules.home-manager
          {
            home-manager =
            {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${host.user}.imports =
              [
                ./hosts/${host.name}/home.nix
                ./modules/homeManager/default.nix
              ];
              extraSpecialArgs =
              {
                host = host.name;
                user = host.user;
                inherit inputs;
              };
            };
          }
        ];
      };
    }) desktops);
  };
}
