{pkgs, config, lib, ...}:
let
  kernelName = config.desktop.kernel.name;
in
{
  environment.systemPackages = with pkgs;
  [
    scx.full
  ];
  boot =
  {
    kernelPackages = 
    (
      if (config.desktop.kernel.name == "lqx") then pkgs.linuxPackages_lqx
      else if (config.desktop.kernel.name == "zen") then pkgs.linuxPackages_zen
      else pkgs.linuxPackages_latest
    );
  };
}