{pkgs, pkgs-stable, ...}:
{
  environment.systemPackages = 
  (
    with pkgs-stable;
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
      # Packaging
      unrar
      unzip
    ]
  ) ++ 
  ( 
    with pkgs-stable;
    [
      # Media
      wf-recorder
      ffmpeg-full
    ]
  );
  programs.fish =
  {
    enable = true;
  };
}
