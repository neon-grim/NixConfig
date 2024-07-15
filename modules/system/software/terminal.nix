{pkgs, ...}:
{
  programs.fish.enable = true;
  environment.systemPackages = with pkgs;
  [
    cava
    git
    fastfetch
    lazygit
    nnn
    nix-prefetch-git
    psmisc
    terminator
    usbutils
  ];
}