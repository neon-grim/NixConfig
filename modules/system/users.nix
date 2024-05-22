{config, host, pkgs, ...}:
let
  inherit (import ../../hosts/${host}/variables.nix)
    username
    userDescription
    userGroups;
in
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."${username}" = {
    isNormalUser = true;
    description = "${userDescription}";
    extraGroups = userGroups;
    packages = with pkgs; [ ];
  };
}