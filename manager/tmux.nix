{ config, pkgs, ... }:
{
	programs.tmux = {
		enable = true;
		baseIndex = 1;
		escapeTime = 1;
		
		plugins = with pkgs; [
			{
				plugin = tmuxPlugins.resurrect;
				extraConfig = "set -g @resurrect-strategy-nvim 'session'";
			}
			{
				plugin = tmuxPlugins.continuum;
				extraConfig = ''
					set -g @continuum-restore 'on'
					set -g @continuum-save-interval '60' #minutes
				'';
			}
		];
	};
}
