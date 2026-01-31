{
  description = "NeonGrim NixOS flake";
  
  inputs =
  {
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";
  };
  
  outputs = inputs@{self, nix-cachyos-kernel, nixpkgs, nixpkgs-stable, home-manager, ...}:
  let
    arch = "x86_64-linux";
    desktops =
    [
      { name = "SmelterDeamon"; user = "ashen_one"; }
      { name = "Susanoo"; user = "order_shadow"; }
    ];
    kernelOverlays = nix-cachyos-kernel.overlays.pinned;
    pkgs-stable = import nixpkgs-stable
    {
      system = arch;
      config.allowUnfree = true;
    };
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
          inherit pkgs-stable;
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
          (
            { pkgs, ... }:
            {
              nixpkgs.overlays = 
              [
                kernelOverlays
              ];
              nix.settings =
              {
                substituters = [ "https://attic.xuyh0120.win/lantian" ];
                trusted-public-keys = [ "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc=" ];
              };
            }
          )
        ];
      };
    }) desktops);
  };
}
