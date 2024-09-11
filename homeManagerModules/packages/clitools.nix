{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    user.packages = {
      pass.enable = lib.mkEnableOption "Install pass";
      neofetch.enable = lib.mkEnableOption "Enable neofetch";
    };
  };
  config = {
    home = {
      packages = with pkgs;
      # Install pass
        lib.optionals config.user.packages.pass.enable [
          pass
        ]
        # Install fastfetch as neofetch wrapper
        ++ (lib.optionals config.user.packages.neofetch.enable [
          fastfetch
        ]);

      # Fastfetch config
      file = {
        ".config/fastfetch/config.jsonc" = lib.mkIf config.user.packages.neofetch.enable {
          text = ''
            {
                "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
                "display": {
                    "size": {
                        "maxPrefix": "MB",
                        "ndigits": 0
                    }
                },
                "modules": [
                    "title",
                    "separator",
                    "os",
                    "host",
                    "kernel",
                    "uptime",
                    "packages",
                    "shell",
                    {
                        "type": "display",
                        "compactType": "original",
                        "key": "Resolution"
                    },
                    "wm",
                    "terminal",
                    "editor",
                    "cpu",
                    {
                        "type": "gpu",
                        "key": "GPU"
                    },
                    {
                        "type": "memory",
                        "format": "{/1}{-}{/}{/2}{-}{/}{} / {}"
                    },
                    "disk",
                    "vulkan",
                    "opengl",
                    "opencl",
                    "break",
                    "colors"
                ]
            }
          '';
        };
      };
    };
  };
}
