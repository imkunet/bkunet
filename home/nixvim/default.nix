{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "mocha";
    };

    opts = {
      breakindent = true;
      clipboard = "unnamedplus";
      copyindent = true;
      expandtab = true;
      mouse = "a";
      number = true;
      preserveindent = true;
      relativenumber = true;
      shiftwidth = 2;
      showtabline = 2;
      smartcase = true;
      smartindent = true;
      softtabstop = 2;
      tabstop = 2;
    };

    keymaps = [
      {
        key = ";";
        action = ":";
      }
      {
        key = "<leader>cs";
        action = "<cmd>noh<cr>";
      }
      {
        key = "<leader>e";
        action = "<cmd>Neotree toggle<cr>";
      }
      {
        key = "<leader>n";
        action = "<cmd>Trouble symbols toggle<cr>";
      }
      {
        key = "<leader>m";
        action = "<cmd>Trouble diagnostics toggle<cr>";
      }
      {
        key = "<f2>";
        action = "<cmd>lua vim.lsp.buf.rename()<cr>";
      }
      {
        key = "<leader>lg";
        action = "<cmd>lua Snacks.lazygit.open()<cr>";
      }
      {
        key = "<leader>b";
        action = "<cmd>lua Snacks.terminal.toggle()<cr>";
      }
    ];

    globals.mapleader = " ";

    plugins = {
      barbar = {
        enable = true;
        keymaps = {
          close = {
            key = "<leader>w";
          };
          closeAllButCurrent = {
            key = "<leader>W";
          };
          next = {
            key = "<A-.>";
          };
          previous = {
            key = "<A-,>";
          };
        };
        settings = {
          animation = false;
          icons = {
            separator_at_end = false;
          };
        };
      };
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "treesitter"; }
          ];
          mapping = {
            "<c-e>" = "cmp.mapping.abort()";
            "<up>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<down>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<tab>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })";
          };
        };
      };
      flash = {
        enable = true;
        settings = {
          modes.char.jump_labels = true;
        };
      };
      lualine = {
        enable = true;
        settings = {
          options = {
            section_separators = " ";
            component_separators = "|";
            disabled_filetypes = [ "dashboard" ];
          };
        };
      };
      lsp = {
        enable = true;
        servers = {
          clangd.enable = true;
          eslint.enable = true;
          nixd = {
            enable = true;
            settings.formatting.command = [ ];
          };
          pyright.enable = true;
          rust_analyzer = {
            enable = true;
            settings.check.command = "clippy";
            installRustc = false;
            installCargo = false;
          };
          statix.enable = true;
          tailwindcss.enable = true;
          tinymist.enable = true;
          ts_ls.enable = true;
          typos_lsp = {
            enable = true;
            extraOptions.init_options.diagnosticSeverity = "Hint";
          };
          yamlls = {
            enable = true;
            extraOptions = {
              settings = {
                hover = true;
                completion = true;
                validate = true;
                yaml = {
                  schemaStore.enable = true;
                  format.enable = true;
                };
              };
            };
          };
          zls.enable = true;
        };
        keymaps = {
          lspBuf = {
            ca = "code_action";
            gd = "definition";
            K = "hover";
          };
        };
      };
      lsp-format = {
        enable = true;
        settings = {
          nix = {
            exclude = [ "nixd" ];
            order = [
              "null-ls"
              "statix"
            ];
            force = true;
            sync = true;
          };
        };
        autoLoad = true;
      };
      neo-tree = {
        enable = true;
        filesystem.useLibuvFileWatcher = true;
      };
      none-ls = {
        enable = true;
        enableLspFormat = true;
        autoLoad = true;
        sources.formatting = {
          nixfmt = {
            enable = true;
            package = pkgs.nixfmt-rfc-style;
          };
          treefmt = {
            enable = true;
            package = pkgs.treefmt;
          };
        };
      };
      snacks = {
        enable = true;
        settings = {
          bigfile = {
            enabled = true;
          };

          dashboard = {
            enabled = true;

            preset = {
              keys = [
                {
                  desc = "New File";
                  action = ":ene | startinsert";
                  icon = " ";
                  key = "n";
                }
                {
                  desc = "Find File";
                  action = "<leader>ff";
                  icon = "󰮗 ";
                  key = "f";
                }
                {
                  desc = "Find Text";
                  action = "<leader>fg";
                  icon = "󱈆 ";
                  key = "g";
                }
                {
                  action = ":qa";
                  key = "q";
                  icon = "󰈆 ";
                  desc = "Quit";
                }
              ];
            };

            sections = [
              {
                cmd = "cat ${./edit.txt}; sleep .1";
                height = 15;
                padding = 1;
                section = "terminal";
                ttl = 5 * 60;
              }
              {
                gap = 1;
                padding = 1;
                section = "keys";
              }
              {
                icon = " ";
                indent = 2;
                padding = 1;
                pane = 2;
                section = "recent_files";
                title = "Recent Files";
              }
              {
                cmd = "${pkgs.git}/bin/git --no-pager diff HEAD --stat -B -M -C 2>/dev/null || ${pkgs.gum}/bin/gum format 'Not in a `󰊢 git` repository'";
                height = 10;
                icon = "󰊢 ";
                indent = 2;
                padding = 1;
                pane = 2;
                section = "terminal";
                title = "Git Status";
                ttl = 5 * 60;
              }
            ];
          };

          git = {
            enabled = true;
          };

          indent = {
            enabled = true;
            animate = {
              enabled = false;
            };
          };

          input = {
            enabled = true;
          };

          lazygit = {
            enabled = true;
            configure = false;
          };

          notifier = {
            enabled = true;
            timeout = 3000;
          };

          quickfile = {
            enabled = true;
          };

          scope = {
            enabled = true;
          };

          statuscolumn = {
            enabled = true;
          };

          words = {
            enabled = true;
            debounce = 100;
          };
        };
      };
      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = {
            action = "find_files";
          };
          "<leader>fg" = {
            action = "live_grep";
          };
          "<leader>fb" = {
            action = "buffers";
          };
          "<leader>fd" = {
            action = "lsp_workspace_symbols";
          };
        };
      };
      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
          indent.enable = true;
        };
      };
      trouble = {
        enable = true;
      };
      web-devicons = {
        enable = true;
      };
      which-key = {
        enable = true;
      };
    };
  };
}
