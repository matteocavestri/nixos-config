{pkgs, ...}: {
  home.packages = with pkgs; [
    fastfetch
  ];
  home.file.".config/fastfetch/config.jsonc".text = ''
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
}
