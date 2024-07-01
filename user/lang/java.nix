{ pkgs, ... }:

{
  home.packages = with pkgs; [
    jdk # Java dev kit
    jdt-language-server # Jdtls integration
  ];
}
