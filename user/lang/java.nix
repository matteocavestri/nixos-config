{pkgs, ...}: {
  home.packages = with pkgs; [
    jdk
    gradle
    sbt
    scala
  ];
}
