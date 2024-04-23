{ pkgs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ashen_one = {
    isNormalUser = true;
    description = "Michael Mueller de los Santos";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; 
    [
      
    ];
  };
}
