{config, pkgs, ... }: 
{
  # enable Polkit
  security.polkit.enable = true;
  
  # Security services
  security.rtkit.enable = true;
  
  # get polkit auth agent 
  environment.systemPackages = with pkgs;
  [
    pantheon.pantheon-agent-polkit
  ];
}
