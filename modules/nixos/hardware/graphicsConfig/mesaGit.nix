{pkgs, config, ...}:
{
  chaotic.mesa-git =
  {
    enable = (config.desktop.amd.enable && config.desktop.amd.mesaGit);
  };
}
