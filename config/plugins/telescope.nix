{ helpers, ... }: {
  plugins.telescope = {
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
    };
  };
  keymaps = [

    {
      key = "<Tab><Tab>";
      mode = [ "n" "v" ];
      action = helpers.mkRaw ''function() require("telescope.builtin").find_files() end'';
      options = {
        silent = true;
        desc = "Find Files";
      };

    }
  ];
}

