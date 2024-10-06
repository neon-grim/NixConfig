{
  description = "SmelterDeamon NixOS flake";
  inputs =
  {
    home-manager =
    {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    zen-browser.url = "github:MarceColl/zen-browser-flake";
  };
  outputs = inputs@{self, nixpkgs, home-manager, ...}:
  let
    compositor = "hyprland";
    lib = nixpkgs.lib;
    host = "SmelterDeamon";
    owner = "Michael Mueller de los Santos";
    user = "ashen_one";
    themeConfig = "andromeda";
    systemArch = "x86_64-linux";
  in
  {
    nixosConfigurations =
    {
      "${host}" = lib.nixosSystem
      {
        system = "${systemArch}";
        specialArgs =
        {
          inherit compositor;
          inherit host;
          inherit inputs;
          inherit owner;
          inherit user;
          inherit systemArch;
        };
        modules =
        [
          ./hosts/${host}/configuration.nix
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
              inherit owner;
              inherit user;
              inherit themeConfig;
            };
          }
        ];
      };
    };
  };
}
