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
    exiftool
    ffmpeg-full
    # Packaging
    unrar
    unzip
  ];
  programs.fish =
  {
    enable = true;
  };
}
