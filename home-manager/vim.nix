{ pkgs,lib,pkgs-unstable,... }:
{
	programs.neovim = 
		let
			#toLua = str: "lua << EOF\n${str}\nEOF\n";
			toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
			leer = file: builtins.readFile file;

			himalaya-nvim = pkgs.vimUtils.buildVimPlugin {
				pname = "himalaya-nvim";
				version = "unstable";
				src = pkgs.fetchFromGitHub {
					owner = "knownasnaffy";        # el autor del plugin Lua
						repo = "himalaya.nvim";   # nombre exacto del repo
						rev = "main";
					hash = "sha256-hMGa9iTEvODyOEj9gwa082oTTEPpuCps5OK7oNsy2sM="; # Nix te dará el hash real al compilar
				};
				dependencies = [ pkgs.vimPlugins.nui-nvim ];
			};
		in
			{
			enable = true;

			viAlias = true;
			vimAlias = true;
			vimdiffAlias = true;
			initLua= ''
				${builtins.readFile ./nvim/options.lua}
			'';
			extraPackages = with pkgs; [
				kdePackages.qtdeclarative
				nixd							#nix
				clang-tools						#c y cpp
				luajitPackages.lua-lsp			#lua
				pyright							#python
				jdt-language-server				#java
				omnisharp-roslyn				#unity
				vscode-langservers-extracted	#web dev
				texlab							#latex
				terraform-ls
				ripgrep							#para live_grep
				poppler-utils
				vscode-extensions.vscjava.vscode-java-debug
				tree-sitter
			]++[pkgs-unstable.himalaya];
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
					config = leer ./nvim/plugin/lsp.lua;
				}
				{
					plugin = nvim-ufo;
					config = leer ./nvim/plugin/pliegues.lua;
					type="lua";
				}
				nvim-jdtls
				{
					plugin = nvim-dap-ui;
					config = leer ./nvim/plugin/debugger.lua;
					type="lua";
				}
				{
					plugin = nvim-cmp;
					config = leer ./nvim/plugin/cmp.lua;
					type="lua";
				}
				cmp_luasnip
				cmp-nvim-lsp
				vim-vsnip
				lspkind-nvim
				cmp-cmdline
				cmp-path
				cmp-buffer
				{
					plugin = smear-cursor-nvim;
					config = leer ./nvim/plugin/cursor.lua;
					type="lua";
				}

				
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
							p.terraform
					]);
				#	type="lua";
				#	config = builtins.readFile ./modulos/nvim/plugin/treesitter.lua;
				}
				#fin_lsp-config
				#estetica
				{
					plugin = gruvbox-nvim;
					type="lua";
					config = ''
						require("gruvbox").setup()
						vim.cmd.colorscheme('gruvbox')
						'';
				}
				#{
				#	plugin = neo-tree-nvim;
				#	type="lua";
				#	config = leer ./nvim/plugin/neo-tree.lua;
				#}
				{
					plugin = lualine-nvim;
					type="lua";
					config = leer ./nvim/plugin/lualine.lua;
				}
				#fin_estetica
				#miscelanea

				{
					plugin = himalaya-nvim;
					type="lua";
					config = leer ./nvim/plugin/himalaya.lua;
				}
				{
					plugin = telescope-nvim;
					type="lua";
					config = leer ./nvim/plugin/telescope.lua;
				}
				#{
				#	plugin = obsidian-nvim;
				#	type="lua";
				#	config = leer ./modulos/nvim/plugin/obsidian.lua;
				#}
				{
					plugin = nvim-autopairs;
					type="lua";
					config = leer ./nvim/plugin/autopair.lua;
				}
				{
					plugin = alpha-nvim;
					type="lua";
					config = leer ./nvim/plugin/alpha.lua;
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
