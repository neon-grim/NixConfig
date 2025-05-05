{pkgs, config, lib, ...}:
{
  imports =
  [
    ./gpuUserSpaceDrivers/amdvlk.nix
  ];
  config = lib.mkIf (config.desktop.amd.enable)
  {
    environment.systemPackages = with pkgs;
    [
      libva-utils
      unigine-heaven
      unigine-valley
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
  };
}