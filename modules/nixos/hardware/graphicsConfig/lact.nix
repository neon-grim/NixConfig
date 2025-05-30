{pkgs, inputs, ...}:
{
  environment.systemPackages = with pkgs;
  [
    lact
  ];
  nixpkgs.overlays = 
  [
    (final: prev: {
      lact = final.callPackage "${inputs.lact}/pkgs/by-name/la/lact/package.nix"
      {
        hwdata = final.callPackage "${inputs.lact}/pkgs/by-name/hw/hwdata/package.nix" { };
      };
    })
  ];
  systemd.services.lactd =
  {
    enable = true;
    after = [ "multi-user.target" ];
    description = "AMDGPU Control Daemon";
    serviceConfig =
    {
      ExecStart = "${pkgs.lact}/bin/lact daemon";
    };
    wantedBy = [ "multi-user.target" ];
  };
}