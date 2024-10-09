{lib, ...}:
{
  options.desktop.software =
  {
    flatpak = lib.mkOption
    {
      type= lib.types.bool;
      default = false;
    };
    virtualization = lib.mkOption
    {
      type = lib.types.bool;
      default = false;
    };
  };
}