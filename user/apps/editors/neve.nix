{ inputs, pkgs, ... }:

{
 # imports = [
 #   ./neve/default.nix
 # ];
  home.packages = [
# Neve editor
    inputs.neve.packages.${pkgs.system}.default # Neve editor
    pkgs.neovide # Neovide GUI editor
# Utilities
    pkgs.ripgrep
# LSPs
    pkgs.sumneko-lua-language-server# Lua
    pkgs.java-language-server # Java
    pkgs.bash-language-server # Bash
    pkgs.gopls # Go
    pkgs.dockerfile-language-server-nodejs # Dockerfile
    pkgs.docker-compose-language-service # Docker Compose
    pkgs.rust-analyzer # Rust
# Formatters
    pkgs.stylua # Lua
    pkgs.black # Python
    pkgs.google-java-format # Java
    pkgs.shfmt # Shell
    pkgs.yamlfmt # Yaml
    pkgs.nodePackages.prettier # Javascript/Typescript ... Various
    #pkgs.rustywind # Rust TODO
    pkgs.rustfmt # Rust
# Linters
    pkgs.statix # Nix
    pkgs.selene # Lua
    pkgs.python312Packages.flake8 # Python
    pkgs.eslint_d # Javascript, Typescript
    pkgs.checkstyle # Java
    pkgs.golines # Go
    pkgs.gotools # Go
    pkgs.clippy # Rust
# Debuggers
    pkgs.delve # Go
    pkgs.gdb # C/Cpp/Rust
    pkgs.lldb # Rust

# Nix language
    pkgs.nixfmt-classic # Nix language
  ];
}
