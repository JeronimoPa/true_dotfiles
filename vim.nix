{ pkgs,lib ,... }:
{
	programs.neovim = 
		let
			#toLua = str: "lua << EOF\n${str}\nEOF\n";
			toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
		in
			{
			enable = true;

			viAlias = true;
			vimAlias = true;
			vimdiffAlias = true;
			extraLuaConfig = ''
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
					config = toLuaFile ./modulos/nvim/plugin/lsp.lua;
				}
				{
					plugin = nvim-cmp;
					config = toLuaFile ./modulos/nvim/plugin/cmp.lua;
				}
				cmp_luasnip
				cmp-nvim-lsp
				luasnip
				friendly-snippets
				{
					plugin = (nvim-treesitter.withPlugins (p: [
						p.tree-sitter-nix
						p.tree-sitter-vim
						p.tree-sitter-bash
						p.tree-sitter-lua
						p.tree-sitter-python
						p.tree-sitter-java
						p.tree-sitter-c
						p.tree-sitter-cpp
						p.tree-sitter-c-sharp
						p.tree-sitter-markdown
					]));
					config = toLuaFile ./modulos/nvim/plugin/treesitter.lua;
				}
				#fin_lsp-config
				#estetica
				{
					plugin = gruvbox-nvim;
					config = "colorscheme gruvbox";
				}
				{
					plugin = neo-tree-nvim;
					config = toLuaFile ./modulos/nvim/plugin/neo-tree.lua;
				}
				{
					plugin = lualine-nvim;
					config = toLuaFile ./modulos/nvim/plugin/lualine.lua;
				}
				#fin_estetica
				#miscelanea
				{
					plugin = telescope-nvim;
					config = toLuaFile ./modulos/nvim/plugin/telescope.lua;
				}
				{
					plugin = obsidian-nvim;
					config = toLuaFile ./modulos/nvim/plugin/obsidian.lua;
				}
				{
					plugin = nvim-autopairs;
					config = toLuaFile ./modulos/nvim/plugin/autopair.lua;
				}
				himalaya-vim
				{
					plugin = alpha-nvim;
					config = toLuaFile ./modulos/nvim/plugin/alpha.lua;
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
