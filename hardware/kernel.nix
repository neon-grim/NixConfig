{ config, pkgs, ... }:

{
  # change to zen kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;
}
