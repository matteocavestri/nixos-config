{pkgs, ...}: {
  home.packages = with pkgs; [
    gcc # C compiler
    go # Go programming language
    jdk # Java development kit
    scala # Scala programming language
    typescript # TypeScript programming language
    lua # Lua programming language
    rustc # Rust compiler
    zig # Zig programming language
    nodejs # Node.js
  ];
}
