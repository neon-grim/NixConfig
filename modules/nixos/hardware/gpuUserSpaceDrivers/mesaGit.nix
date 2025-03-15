{pkgs, config, lib, ...}:
{
  config = lib.mkIf (config.desktop.amd.enable && config.desktop.amd.mesaGit)
  {
    chaotic =
    {
      mesa-git.enable = true;
    };
  };
}
