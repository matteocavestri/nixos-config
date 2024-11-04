{
  lib,
  pkgs,
  config,
  userSettings,
  ...
}: {
  options = {
    user.packages = {
      langs = {
        c.enable = lib.mkEnableOption "Install C/Cpp compiler and developer tools";
        go.enable = lib.mkEnableOption "Install Go programming language";
        jvm.enable = lib.mkEnableOption "Install Java/Scala development kit";
        web.enable = lib.mkEnableOption "Install Web development tools";
        lua.enable = lib.mkEnableOption "Install Lua programming language";
        rust.enable = lib.mkEnableOption "Install Rust compiler and tools";
        zig.enable = lib.mkEnableOption "Install Zig programming language";
        python.enable = lib.mkEnableOption "Install Python programming language";
      };
      git.enable = lib.mkEnableOption "Install git and configure it";
    };
  };
  config = {
    home.packages = with pkgs;
    # Install packages for C/Cpp development
      lib.optionals config.user.packages.langs.c.enable [
        gcc
        gnumake
        cmake
        gdb
        lldb_18
      ]
      # Install packages for Go development
      ++ (lib.optionals config.user.packages.langs.go.enable [
        go
        delve
      ])
      # Install packages for JVM development (Java/Scala/kotlin)
      ++ (lib.optionals config.user.packages.langs.jvm.enable [
        jdk
        scala
        gradle
        sbt
      ])
      # Install packages for Web development (nodejs/typescript)
      ++ (lib.optionals config.user.packages.langs.web.enable [
        typescript
        nodejs
        nodePackages.npm
      ])
      # Install packages for Lua development
      ++ (lib.optionals config.user.packages.langs.lua.enable [
        lua
        luajitPackages.luarocks-nix
      ])
      # Install packages for Rust development
      ++ (lib.optionals config.user.packages.langs.rust.enable [
        rustc
        cargo
        clippy # Rust linter
        rustfmt
        lldb_18
      ])
      # Install packages for Zig development
      ++ (lib.optionals config.user.packages.langs.zig.enable [
        zig
      ])
      # Install packages for Python development
      ++ (
        lib.optionals config.user.packages.langs.python.enable [
          (python3.withPackages (ps:
            with ps; [
              pip
              pytest
            ]))
          pipx
        ]
      );

    # Install and configure git
    programs.git = lib.mkIf config.user.packages.git.enable {
      enable = true;
      lfs.enable = true;
      userName = userSettings.user.name;
      userEmail = userSettings.user.email;
      extraConfig = {
        init.defaultBranch = "main";
        safe.directory = [
          ("/home/" + userSettings.user.username + "/.dotfiles")
          ("/home/" + userSettings.user.username + "/.dotfiles/.git")
        ];
      };
    };
  };
}
