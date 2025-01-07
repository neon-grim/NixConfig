{
  description = "SmelterDeamon NixOS flake";
  inputs =
  {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager =
    {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };
  };
  outputs = inputs@{self, nixpkgs, home-manager, ...}:
  let
    lib = nixpkgs.lib;
    systemArch = "x86_64-linux";
  in
  {
    nixosConfigurations =
    let
      compositor = "hyprland";
      host = "SmelterDeamon";
      user = "ashen_one";
    in
    {
      "${host}" = lib.nixosSystem
      {
        system = "${systemArch}";
        specialArgs =
        {
          inherit compositor;
          inherit host;
          inherit inputs;
          inherit user;
          inherit systemArch;
        };
        modules =
        [
          ./hosts/${host}/config.nix
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
