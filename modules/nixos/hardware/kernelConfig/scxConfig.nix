{pkgs, ...}:
{
  services.scx =
  {
    enable = false;
    package = pkgs.scx.full;
    scheduler = "scx_bpfland";
  };
}