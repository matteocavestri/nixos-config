{pkgs, ...}: {
  home.packages = with pkgs; [
    gnumake # Makefiles
    cmake # CMake
    gdb # C/C++ debugger
    delve # Go debugger
    gradle # Java build tool
    sbt # Scala build tool
    nodePackages.npm # Node.js package manager
    luajitPackages.luarocks-nix # Lua package manager
    (python3.withPackages (ps:
      with ps; [
        pip # Python package manager
        pytest # Python testing
      ]))
    pipx # Python package manager
    cargo # Rust package manager
    clippy # Rust linter
    lldb_18 # C++/Rust debugger
    rustfmt # Rust formatter
    atac
    sshs
  ];
}
