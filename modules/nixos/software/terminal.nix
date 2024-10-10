{pkgs, ...}:
{
  environment.systemPackages = with pkgs;
  [
    git
    fastfetch
    lazygit
    nix-prefetch-git
    psmisc
    unrar
    usbutils
  ];
  programs.fish =
  {
    enable = true;
  };
}