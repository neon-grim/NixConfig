{ config, pkgs, ... }:
{
  # change to zen kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;
  
  # set overclocking parameter
  boot.kernelParams = [ "amdgpu.ppfeaturemask=0xffffffff" ];
  
  boot.kernelModules = [ "xpad-noone" ];
  boot.extraModulePackages = [ (config.boot.kernelPackages.callPackage ./xpad.nix {}) ];
}
