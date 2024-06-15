{config, host, pkgs, username, ...}:
let
  inherit (import ../../../hosts/${host}/variables.nix)
    userDescription
    userGroups;
in
{
  users.users."${username}" = {
    isNormalUser = true;
    description = "${userDescription}";
    extraGroups = userGroups;
    packages = with pkgs; [ ];
  };
}