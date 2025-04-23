{pkgs, config, lib, ...}:
{
  imports =
  [
    ./gpuUserSpaceDrivers/amdvlk.nix
    ./gpuUserSpaceDrivers/mesaGit.nix
  ];
  config = lib.mkIf (config.desktop.amd.enable)
  {
    environment.systemPackages = with pkgs;
    [
      vulkan-tools
      unigine-heaven
      unigine-valley
    ];
    hardware =
    {
      amdgpu =
      {
        opencl.enable = true;
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