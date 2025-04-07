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
    wf-recorder
  ];
  programs.fish =
  {
    enable = true;
  };
}
