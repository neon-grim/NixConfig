{config, host, username, ...}:
let
  inherit (import ../../../hosts/${host}/hostSpecific/systemConfig.nix)
    userDescription
    userGroups;
in
{
  users.users."${username}" = {
    isNormalUser = true;
    description = "${userDescription}";
    extraGroups = userGroups;
  };
}