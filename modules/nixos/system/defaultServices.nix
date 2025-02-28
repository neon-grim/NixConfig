{host, config, user, inputs, ...}:
let
  kbLayout = config.home-manager.users.${user}.desktop.system.kb.layout;
  kbVariant = config.home-manager.users.${user}.desktop.system.kb.variant;
  locale = config.desktop.system.locale;
  time = config.desktop.system.timeZone;
  AzeronVendorId = "16d0";
  AzeronProductId = "10bc";
in
{
  imports =
  [
    inputs.chaotic.nixosModules.default
  ];
  networking =
  {
    hostName = "${host}";
    networkmanager.enable = true;
  };
  services =
  {
    dbus.enable = true;
    geoclue2.enable = true;
    udev.extraRules =
    ''
      ATTRS{idVendor}=="${AzeronVendorId}", ATTRS{idProduct}=="${AzeronProductId}", RUN+="/sbin/modprobe xpad" RUN+="/bin/sh -c 'echo ${AzeronVendorId} ${AzeronProductId} > /sys/bus/usb/drivers/xpad/new_id'"
    '';
    xserver =
    {
      enable = true;
      xkb =
      {
        layout = kbLayout;
        variant = kbVariant;
      };
    };
  };
  # Unknown
  console.keyMap = "sg";
  # Package Settings
  system.stateVersion = "23.11";
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # System Settings
  i18n.defaultLocale = locale;
  time.timeZone = time;
}