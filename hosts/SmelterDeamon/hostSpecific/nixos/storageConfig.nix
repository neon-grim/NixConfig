{
  fileSystems."/mnt/NVME4SSD2" = 
  {
    device = "/dev/disk/by-label/NVME4SSD2";
    fsType = "ext4";
    options = 
    [
      "nofail" 
      "x-gvfs-show"
    ]; 
  };
  fileSystems."/mnt/NVME4SSD1" = 
  {
    device = "/dev/disk/by-label/NVME4SSD1";
    fsType = "ext4";
    options =
    [
      "nofail"
      "x-gvfs-show"
    ];
  };
}
