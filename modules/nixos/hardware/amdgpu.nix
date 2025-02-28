{pkgs, config, lib, ...}:
{
  config = lib.mkIf (config.desktop.drivers.amd.enable)
  {
    environment.systemPackages = with pkgs;
    [
      lact
      vulkan-tools
      unigine-heaven
      unigine-superposition
      unigine-valley
    ];
    chaotic =
    {
      mesa-git.enable = true;
    };
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