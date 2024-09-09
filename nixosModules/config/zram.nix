{
  config,
  lib,
  ...
}: {
  options = {
    system.config.zram.enable = lib.mkEnableOption "Enable zram swap";
  };

  config = lib.mkIf config.system.config.zram.enable {
    zramSwap = {
      enable = true;
      memoryMax = 32768000000; # 32GB
      algorithm = "zstd";
      memoryPercent = 200;
    };
  };
}
