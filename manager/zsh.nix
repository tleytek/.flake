{ config, pkgs, lib, ... }:
{
  programs = {
    zsh = {
      enable = true;
      autosuggestion.enable = false;
      syntaxHighlighting.enable = true;
      shellAliases = {
        config = "git --git-dir=$HOME/.config/ --work-tree=$HOME";
      };
      sessionVariables = {
        npmrcc = "$(zsh -c pass)";
      };
      oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [
          "git"
            "npm"
            "history"
            "node"
        ];
      };
    };
  };
}
