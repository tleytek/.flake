{ config, pkgs, ... }:
{
  programs = {
	zsh = {
		enable = true;
		autosuggestion.enable = false;
		syntaxHighlighting.enable = true;
		shellAliases = {
			config = "git --git-dir=$HOME/.config/ --work-tree=$HOME";
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
