{ pkgs, ... }:
{
  plugins.none-ls = {
    enable = false;
    enableLspFormat = false;
    updateInInsert = false;
    onAttach = ''
      function(client, bufnr)
          if client.supports_method "textDocument/formatting" then
            vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format { bufnr = bufnr }
              end,
            })
          end
        end
    '';
    sources = {
      code_actions = {
        gitsigns.enable = true;
        statix.enable = true;
      };
      diagnostics = {
        checkstyle = {
          enable = true;
        };
        statix = {
          enable = true;
        };
      };
      formatting = {
# Nix
        alejandra = {
          enable = true;
        };
# Shell
        shfmt = {
          enable = true;
        };
# Rust TODO
        rustywind = {
          enable = true;
        };
# Go
        goimports = {
          enable = true;
        };
        golines = {
          enable = true;
        };
# Yaml
        yamlfmt = {
          enable = true;
        };
# Various
        prettier = {
          enable = true;
          disableTsServerFormatter = true;
          withArgs = ''
            {
              extra_args = { "--no-semi", "--single-quote" },
            }
          '';
        };
# Java
        google_java_format = {
          enable = true;
        };
# Lua
        stylua = {
          enable = true;
        };
# Pythont
        black = {
          enable = true;
          withArgs = ''
            {
              extra_args = { "--fast" },
            }
          '';
        };
      };
    };
  };
  # keymaps = [
  #   {
  #     mode = [ "n" "v" ];
  #     key = "<leader>cf";
  #     action = "<cmd>lua vim.lsp.buf.format()<cr>";
  #     options = {
  #       silent = true;
  #       desc = "Format";
  #     };
  #   }
  # ];
}
