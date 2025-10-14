{pkgs, ...}:
{
  environment.systemPackages = with pkgs;
  [
    # Repo
    git
    lazygit
    nix-prefetch-git
    # Editor
    neovim
    # Utils
    psmisc
    usbutils
    # Packaging
    unrar
    unzip
    # Media
    wf-recorder
    ffmpeg-full
  ];
  programs.fish =
  {
    enable = true;
  };
}
