{pkgs, ...}: {
  home.packages = with pkgs; [
    jdk # Java dev kit
  ];
}
