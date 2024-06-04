{ helpers, ... }: {
  imports = [
    ./rust.nix
    ./nix.nix
  ];
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
