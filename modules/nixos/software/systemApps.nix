{pkgs, ...}:
{
  environment.systemPackages = with pkgs;
  [
    # Editing
    gimp
    kdePackages.kdenlive
    pinta
    # Media
    celluloid
    lollypop
    eog
    # Office
    collabora-desktop
    hunspell
    hunspellDicts.en_US
    hunspellDicts.en_GB-large
    hunspellDicts.de_CH
    hyphen
    hyphenDicts.en_US
    hyphenDicts.en_GB
    hyphenDicts.de-ch
    mousepad
    # Tools
    qbittorrent
    python315
  ];
  environment.sessionVariables =
  {
    DICPATH = "/run/current-system/sw/share/hunspell:/run/current-system/sw/share/hyphen";
  };
}
