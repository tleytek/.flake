{ config, pkgs, lib, ... }:
{
	programs.neovim = {
		viAlias = true;
		vimAlias = true;
		vimdiffAlias = true;

		# extraLuaConfig = lib.fileContents ../../.config/nvim/init.lua;
	};
}
