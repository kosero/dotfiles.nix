{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      llvm-vs-code-extensions.vscode-clangd
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "nix-extension-pack";
        publisher = "pinage404";
        version = "3.0.0";
        sha256 = "sha256-cWXd6AlyxBroZF+cXZzzWZbYPDuOqwCZIK67cEP5sNk=";
      }
    ];
  };
}
