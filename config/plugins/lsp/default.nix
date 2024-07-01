{ helpers, ... }: {
  imports = [
    ./rust.nix
    ./nix.nix
    ./java.nix
  ];

  plugins = {
    lsp.enable = true;
    lsp-lines = {
      enable = true;
      # Has been renamed to diagnostics.virtual_lines.only_current_line
      #      currentLine = true;
    };
    lsp-format.enable = true;
  };
  keymaps = [
    {
      key = "<Space>";
      mode = [ "n" "v" ];
      action = helpers.mkRaw ''function() require("vim.lsp.buf").declaration() end'';
      options = {
        silent = true;
        desc = "Goto Declaration";
      };
    }
  ];
}
