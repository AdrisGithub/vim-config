{ pkgs, ... }: {
  plugins.lsp.servers.nil-ls = {
    enable = true;
    settings.formatting.command = [ "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt" ];
  };
}
