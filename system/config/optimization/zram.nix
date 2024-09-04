{
  zramSwap = {
    enable = true;
    memoryMax = 32768000000; # 32GB
    algorithm = "zstd";
    memoryPercent = 200;
  };
}
