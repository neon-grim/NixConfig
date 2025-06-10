{
  description = "NeonGrim NixOS flake";
  
  inputs =
  {
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland";
    lact.url = "github:cything/nixpkgs?ref=lact";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  
  outputs = inputs@{self, nixpkgs, home-manager, ...}:
  {
    nixosConfigurations =
    let
      host = "SmelterDeamon";
      user = "ashen_one";
    in
    {
      "${host}" = nixpkgs.lib.nixosSystem
      {
        system = "x86_64-linux";
        specialArgs =
        {
          inherit host;
          inherit inputs;
          inherit user;
        };
        modules =
        [
          ./hosts/${host}/config.nix
          ./modules/nixos/default.nix
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
