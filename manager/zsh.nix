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
      # For content-management-system (Edwin) #
      npmrc2="//npm.pkg.github.com/:_authToken=$(pass show gh/pat/edwin)";
      DOCKER_BUILDKIT="1";
      COMPOSE_DOCKER_CLI_BUILD="1";
      #########################################
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
