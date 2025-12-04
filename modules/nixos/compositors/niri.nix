{pkgs, lib, config, user, ...}:
{
  config =
  {
    environment.systemPackages = with pkgs;
    let
      xwayland-satellite-git = pkgs.xwayland-satellite.overrideAttrs (
        final: prev: {
          version = "git";
          cargoHash = "sha256-QAzAD7N8kReX/O7FSoYfDagOCOBmqTCu98okeYPmhBo=";
          src = pkgs.fetchFromGitHub {
            owner = "Supreeeme";
            repo = "xwayland-satellite";
            rev = "6338574bc5c036487486acde264f38f39ea15fad";
            sha256 = "sha256-Z1TKiux8K09a93w4PFDFsj8HFugXNy3iCC3Z8MpR5Rk=";
          };
          cargoDeps = pkgs.rustPlatform.fetchCargoVendor {
            inherit (final) pname src version;
            hash = final.cargoHash;
          };
        }
      );
    in
    [
      xwayland-satellite-git
    ];
    programs =
    {
      niri.enable = true;
    };
  };
}