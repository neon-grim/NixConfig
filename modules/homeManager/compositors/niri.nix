{pkgs, config, lib, ...}:
let
 startConfig =
 ''
    prefer-no-csd
    
    screenshot-path "~/Pictures/Screenshots/Screenshot_from_%Y-%m-%d %H-%M-%S.png"
    
    hotkey-overlay {
      skip-at-startup
    }
  '';
in
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
    startConfig +
    config.desktop.niri.startup +
    config.desktop.niri.environmentVariables +
    config.desktop.niri.outputs +
    config.desktop.niri.input +
    config.desktop.niri.layout +
    config.desktop.niri.windowRules +
    config.desktop.niri.binds
  );
}