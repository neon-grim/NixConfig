{host, user, owner, ...}:
{
  users.users."${user}" =
  {
    isNormalUser = true;
    description = "${owner}";
    extraGroups = 
    [
      "networkmanager" 
      "wheel" 
      "libvirt" 
      "kvm" 
      "libvirtd"
      "corectrl"
      "gamemode"
    ];
  };
}