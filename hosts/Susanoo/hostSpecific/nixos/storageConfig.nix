{
  fileSystems."/mnt/NVME2SSD" = 
  {
    device = "/dev/disk/by-label/NVME2SSD";
    fsType = "ext4";
    options = 
    [
      "nofail" 
      "x-gvfs-show"
    ]; 
  };
}
