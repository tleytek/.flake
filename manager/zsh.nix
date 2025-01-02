{ config, pkgs, lib, ... }:
{
  programs = {
	zsh = {
		enable = true;
    # promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
		autosuggestion.enable = false;
		syntaxHighlighting.enable = true;
		shellAliases = {
			config = "git --git-dir=$HOME/.config/ --work-tree=$HOME";
		};
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    {
        # name = "powerlevel10k-config";
        src = lib.cleanSource ../..;
        file = ".p10k.zsh";
      }
    ];
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
