{pkgs, ...}:
{
  programs.fish.enable = true;
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
}