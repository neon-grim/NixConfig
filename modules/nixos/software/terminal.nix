{pkgs, ...}:
{
  environment.systemPackages = with pkgs;
  [
    git
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