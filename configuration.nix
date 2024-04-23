{ config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./hardware/storage-config.nix
      ./hardware/sound.nix
      ./hardware/keyboardAndPrinting.nix
      ./hardware/kernel.nix
      ./software/apps.nix
      ./software/polkit.nix
      ./software/desktopEnvironment.nix
      ./system/user.nix
      ./system/theme.nix
    ];

  # bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # define your hostname.
  networking.hostName = "SmelterDeamon";

  # enable networking
  networking.networkmanager.enable = true;

  # set your time zone.
  time.timeZone = "Europe/Zurich";

  # select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  # nixos release
  system.stateVersion = "23.11";

  # enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}
