{host, user, ...}:
{
  users.users."${user}" =
  {
    isNormalUser = true;
    description = "Michael Mueller de los Santos";
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