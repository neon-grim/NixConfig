{
  description = "SmelterDeamon NixOS flake";
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
      systemArch = "x86_64-linux";
    in
    {
      "${host}" = nixpkgs.lib.nixosSystem
      {
        system = "${systemArch}";
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
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${user} = import ./hosts/${host}/home.nix;
            home-manager.extraSpecialArgs =
            {
              inherit compositor;
              inherit host;
              inherit inputs;
              inherit user;
            };
          }
        ];
      };
    };
  };
}
