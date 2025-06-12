{pkgs, ...}:
{
  services.scx =
  {
    enable = true;
    package = pkgs.scx.full;
    scheduler = "scx_bpfland";
    extraArgs =
    [
      "-m performance"
    ];
  };
}