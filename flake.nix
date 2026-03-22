{
  description = "NeonGrim NixOS flake";
  
  inputs =
  {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
  };
  
  outputs = inputs@{self, nixpkgs, home-manager, ...}:
  let
    arch = "x86_64-linux";
    desktops =
    [
      { name = "SmelterDeamon"; user = "ashen_one"; }
      { name = "Susanoo"; user = "order_shadow"; }
    ];
  in
  {
    nixosConfigurations = nixpkgs.lib.listToAttrs (map (host: 
    {
      name = host.name;
      value = nixpkgs.lib.nixosSystem
      {
        system = arch;
        specialArgs =
        {
          host = host.name;
          user = host.user;
        };
        modules =
        [
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
              };
            };
          }
        ];
      };
    }) desktops);
  };
}
