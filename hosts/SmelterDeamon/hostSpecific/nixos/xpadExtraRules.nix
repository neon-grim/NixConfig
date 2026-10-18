{...}:
let
  AzeronVendorId = "16d0";
  AzeronProductId = "13ea";
  KeychronvendorId = "3434";
in
{
  services.udev.extraRules =
  ''
    # Azeron keyzen
    ATTRS{idVendor}=="${AzeronVendorId}", ATTRS{idProduct}=="${AzeronProductId}", RUN+="/sbin/modprobe xpad" RUN+="/bin/sh -c 'echo ${AzeronVendorId} ${AzeronProductId} > /sys/bus/usb/drivers/xpad/new_id'"
    
    # Keychron
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="${KeychronvendorId}", MODE="0660", GROUP="users", TAG+="uaccess"
    # Keychron M5 USB
    SUBSYSTEM=="usb",  ATTRS{idVendor}=="${KeychronvendorId}", ATTRS{idProduct}=="d048", MODE="0660", GROUP="users", TAG+="uaccess"
    # Keychron M5 2.4GHZ
    SUBSYSTEM=="usb",  ATTRS{idVendor}=="${KeychronvendorId}", ATTRS{idProduct}=="d028", MODE="0660", GROUP="users", TAG+="uaccess"
    # Keychron Q1 USB
    SUBSYSTEM=="usb",  ATTRS{idVendor}=="${KeychronvendorId}", ATTRS{idProduct}=="0651", MODE="0660", GROUP="users", TAG+="uaccess"
  '';
}
