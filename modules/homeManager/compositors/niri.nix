{pkgs, config, lib, ...}:
{
  imports =
  [
    ./niri/niriAutoStart.nix
    ./niri/niriBindings.nix
    ./niri/niriEnvVars.nix
    ./niri/niriInputs.nix
    ./niri/niriLayout.nix
    ./niri/niriWindowRules.nix
  ];
  home.file.".config/niri/config.kdl".text =
  (
    config.desktop.niri.startup +
    config.desktop.niri.environmentVariables +
    config.desktop.niri.outputs +
    config.desktop.niri.input +
    config.desktop.niri.layout +
    config.desktop.niri.windowRules +
    config.desktop.niri.binds
  );
}