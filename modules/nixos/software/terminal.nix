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
    unzip
    usbutils
    tmux
  ];
  programs.fish =
  {
    enable = true;
  };
}
