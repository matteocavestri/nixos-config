{
  zramSwap = {
    enable = true;
    memoryMax = 16384000000; # 16GB
    algorithm = "zstd";
    memoryPercent = 200;
  };
}
