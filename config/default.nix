{
  # Import all your configuration modules here
  imports =
    [
      ./plugins
      ./clipboard.nix
      ./color.nix
    ];
  diagnostics.virtual_lines.only_current_line = true;
}

