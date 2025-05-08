{pkgs, config, lib, inputs, ...}:
{
  imports =
  [
    ./gpuUserSpaceDrivers/amdvlk.nix
  ];
  config = lib.mkIf (config.desktop.amd.enable)
  {
    nixpkgs.overlays = 
    [
      (final: prev: {
        lact = final.callPackage "${inputs.lact}/pkgs/by-name/la/lact/package.nix"
        {
          hwdata = final.callPackage "${inputs.lact}/pkgs/by-name/hw/hwdata/package.nix" { };
        };
      })
    ];
    environment.systemPackages = with pkgs;
    [
      libva-utils
      unigine-heaven
      unigine-valley
      lact
    ];
    hardware =
    {
      amdgpu =
      {
        opencl.enable = true;
      };
      graphics =
      {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs;
        [
          libva
        ];
      };
    };
    services.xserver.videoDrivers = 
    [
      "amdgpu"
    ];
    programs.corectrl =
    {
      enable = true;
      gpuOverclock.enable = true;
    };
    systemd.services.lact =
    {
      enable = true;
      after = [ "multi-user.target" ];
      description = "LACT Daemon";
      wantedBy = [ "multi-user.target" ];
      serviceConfig =
      {
        ExecStart = "${pkgs.lact}/bin/lact daemon";
      };
    };
  };
}