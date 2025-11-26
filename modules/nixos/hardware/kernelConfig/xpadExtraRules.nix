{...}:
let
  AzeronVendorId = "16d0";
  AzeronProductId = "13ea";
in
{
  services.udev.extraRules =
  ''
    ATTRS{idVendor}=="${AzeronVendorId}", ATTRS{idProduct}=="${AzeronProductId}", RUN+="/sbin/modprobe xpad" RUN+="/bin/sh -c 'echo ${AzeronVendorId} ${AzeronProductId} > /sys/bus/usb/drivers/xpad/new_id'"
  '';
}
