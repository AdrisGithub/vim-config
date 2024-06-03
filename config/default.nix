{
  # Import all your configuration modules here
  imports = [ ./bufferline.nix ];

  colorschemes.catppuccin.enable = true;
  plugins.lsp = {
    enable = true;
    servers = {
      nil-ls.enable = true;
      #	rust-analyzer.enable = true;
      rust-analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
        settings = {
          check.command = "check";
        };
      };

    };
  };
  plugins.cmp = {
    enable = true;
    autoEnableSources = true;
    settings = {

      mapping = {
        "<CR>" = "cmp.mapping.confirm({ select = true })";
        "<Tab>" = ''
          cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif require("luasnip").expand_or_locally_jumpable() then
              require("luasnip").expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" })
        '';
        "<S-Tab>" = ''
          cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif require("luasnip").jumpable(-1) then
              require("luasnip").jump(-1)
            else
              fallback()
            end
          end, { "i", "s" })
        '';
        "<Up>" = "cmp.mapping.select_prev_item()";
        "<Down>" = "cmp.mapping.select_next_item()";
      };
      snippet.expand = ''
        function(args)
          require('luasnip').lsp_expand(args.body)
        end
      '';
      sources = [
        { name = "nvim_lsp"; }
        { name = "luasnip"; }
        { name = "path"; }
        { name = "buffer"; }
      ];
    };
  };
  plugins.lualine.enable = true;
  plugins.cmp-path.enable = true;
  plugins.cmp-buffer.enable = true;
  plugins.cmp_luasnip.enable = true;
  plugins.cmp-nvim-lua.enable = true;
  plugins.luasnip = {
    enable = true;
    fromVscode = [{ }];
  };
  extraConfigLuaPre = ''
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end
  '';
  plugins = {
    oil.enable = true;
    telescope = {
      enable = true;
      settings = {
        pickers.colorscheme.enable_preview = true;
        defaults = {
          file_ignore_patterns = [ "node_modules" ];
          prompt_prefix = " ";
          selection_caret = "❯ ";
          path_display = [
            "truncate"
          ];
          sorting_strategy = "ascending";
          layout_config = {
            horizontal = {
              prompt_position = "top";
              preview_width = 0.55;
            };
            vertical = {
              mirror = false;
            };
            width = 0.87;
            height = 0.80;
            preview_cutoff = 120;
          };
        };
        keymaps = {
          "<leader>f" = {
            mode = [ "n" "v" ];
            action = ''function() require("telescope.builtin").find_files() end'';
            options = {
              silent = true;
              desc = "Find Files";
            };
          };
        };
      };
    };
};    
keymaps = [
{
        key = "<Tab><Tab>";
        mode = [ "n" "v" ];
        action = ''function() require("telescope.builtin").find_files() end'';
        lua = true;
        options = {
          silent = true;
          desc = "Find Files";
        };
      }
      ];
}
