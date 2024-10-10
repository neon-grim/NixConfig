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
