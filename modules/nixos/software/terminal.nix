{pkgs, ...}:
{
  environment.systemPackages = with pkgs;
  [
    git
    lazygit
    neovim
    nix-prefetch-git
    psmisc
    unrar
    usbutils
    tmux
  ];
  programs.fish =
  {
    enable = true;
  };
}