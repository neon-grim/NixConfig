{config, pkgs, username, windowManager, ...}:
{
  imports = 
  [
    ./../../modules/homeManager/default.nix
    ./../../modules/homeManager/${windowManager}.nix
  ];
  # home manager user info
  home.username = username;
  home.homeDirectory = "/home/${username}";
  # home manager install verison
  home.stateVersion = "23.11";
  # let home manager install and manage itself.
  programs.home-manager.enable = true;
  # User dirs
  xdg = 
  {
    enable = true;
    userDirs = 
    {
      enable = true;
      createDirectories = true;
    };
  };
  # Default apps
  xdg.mimeApps =
  {
    enable = true;
    defaultApplications =
    {
      "audio/mp3" = ["org.gnome.Rhythmbox3.desktop" "vlc.desktop"];
      "audio/flac" = ["org.gnome.Rhythmbox3.desktop" "vlc.desktop"];
      "video/mp4" = ["vlc.desktop"];
      "inode/directory" = ["thunar.desktop"];
      "application/pdf" = ["firefox.desktop"];
      "image/jpeg" = ["org.xfce.ristretto.desktop"];
      "image/png" = ["org.xfce.ristretto.desktop"];
      "text/plain" = ["org.xfce.mousepad.desktop"];
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = ["onlyoffice-desktopeditors.desktop"];
      "application/vnd.openxmlformats-officedocument.presentationml.presentation" = ["onlyoffice-desktopeditors.desktop"];
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = ["onlyoffice-desktopeditors.desktop"];
    };
  };
}
