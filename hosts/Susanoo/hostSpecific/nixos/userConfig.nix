{host, user, ...}:
{
  users.users."${user}" =
  {
    isNormalUser = true;
    description = "David Buetikofer";
    extraGroups = 
    [
      "networkmanager" 
      "wheel" 
      "libvirt" 
      "kvm" 
      "libvirtd"
      "gamemode"
    ];
  };
}
