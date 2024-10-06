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
    host = "SmelterDeamon";
    username = "ashen_one";
    themeConfig = "andromeda";
    windowManager = "windowManagers";
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
          inherit inputs;
          inherit host;
          inherit username;
          inherit windowManager;
          inherit systemArch;
        };
        modules =
        [
          ./hosts/${host}/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username} = import ./hosts/${host}/home.nix;
            home-manager.extraSpecialArgs =
            {
              inherit inputs;
              inherit host;
              inherit username;
              inherit themeConfig;
              inherit windowManager;
            };
          }
        ];
      };
    };
  };
}
