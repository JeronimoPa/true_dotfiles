{ pkgs,lib ,... }:
{
	programs.neovim = 
		let
			#toLua = str: "lua << EOF\n${str}\nEOF\n";
			toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
			leer = file: builtins.readFile file;
		in
			{
			enable = true;

			viAlias = true;
			vimAlias = true;
			vimdiffAlias = true;
			initLua= ''
				${builtins.readFile ./modulos/nvim/options.lua}
			'';
			extraPackages = with pkgs; [
				himalaya						#mail
				nixd							#nix
				clang-tools						#c y cpp
				luajitPackages.lua-lsp			#lua
				pyright							#python
				jdt-language-server				#java
				omnisharp-roslyn				#unity
				vscode-langservers-extracted	#web dev
				texlab							#latex
				ripgrep							#para live_grep
				poppler-utils
			];
			plugins = with pkgs.vimPlugins; [
				#markdown
				markdown-preview-nvim
				markdown-nvim
				render-markdown-nvim
				#fin_markdown
				#lsp-config
				{
					plugin = nvim-lspconfig;
					type="lua";
					config = leer ./modulos/nvim/plugin/lsp.lua;
				}
				{
					plugin = nvim-cmp;
					config = leer ./modulos/nvim/plugin/cmp.lua;
					type="lua";
				}
				cmp_luasnip
				cmp-nvim-lsp
				luasnip
				friendly-snippets

#				nvim-treesitter-parsers.nix
#				nvim-treesitter-parsers.vim
#				nvim-treesitter-parsers.bash
#				nvim-treesitter-parsers.lua
#				nvim-treesitter-parsers.python
#				nvim-treesitter-parsers.java
#				nvim-treesitter-parsers.c
#				nvim-treesitter-parsers.cpp
#				nvim-treesitter-parsers.c_sharp
#				nvim-treesitter-parsers.markdown
				
				{
					plugin = nvim-treesitter.withPlugins (p: [
							p.vim
							p.bash
							p.lua
							p.python
							p.java
							p.c
							p.cpp
							p.c_sharp
							p.markdown
					]);
				#	type="lua";
				#	config = builtins.readFile ./modulos/nvim/plugin/treesitter.lua;
				}
				#fin_lsp-config
				#estetica
				{
					plugin = gruvbox-nvim;
					type="lua";
  					config = "vim.cmd.colorscheme('gruvbox')";
				}
				{
					plugin = neo-tree-nvim;
					type="lua";
					config = leer ./modulos/nvim/plugin/neo-tree.lua;
				}
				{
					plugin = lualine-nvim;
					type="lua";
					config = leer ./modulos/nvim/plugin/lualine.lua;
				}
				#fin_estetica
				#miscelanea
				{
					plugin = telescope-nvim;
					type="lua";
					config = leer ./modulos/nvim/plugin/telescope.lua;
				}
				{
					plugin = obsidian-nvim;
					type="lua";
					config = leer ./modulos/nvim/plugin/obsidian.lua;
				}
				{
					plugin = nvim-autopairs;
					type="lua";
					config = leer ./modulos/nvim/plugin/autopair.lua;
				}
				himalaya-vim
				{
					plugin = alpha-nvim;
					type="lua";
					config = leer ./modulos/nvim/plugin/alpha.lua;
				}
				nvim-web-devicons
				#fin_miscelanea
			];


			# extraLuaConfig = ''
			#   ${builtins.readFile ./nvim/options.lua}
			#   ${builtins.readFile ./nvim/plugin/lsp.lua}
			#   ${builtins.readFile ./nvim/plugin/cmp.lua}
			#   ${builtins.readFile ./nvim/plugin/telescope.lua}
			#   ${builtins.readFile ./nvim/plugin/treesitter.lua}
			#   ${builtins.readFile ./nvim/plugin/other.lua}
			# '';
		};
}
