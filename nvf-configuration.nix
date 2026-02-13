{pkgs, lib, ...}:

{
        programs.neovim.enable = true;       
	programs.nvf = {
    		enable = true;
    # your settings need to go into the settings attribute set
    # most settings are documented in the appendix
    		settings = {
			vim.autopairs.nvim-autopairs.enable = true;
		        vim.ui.borders.enable = true;
                        vim.telescope.enable = true;
                        
                        vim.lsp = {
                                enable = true;
                        };
                        
                        vim.filetree.neo-tree= {
                                enable = true;
                                setupOpts = {
                                        window = {
                                                position = "left";
                                                width = 25;
                                        };
                                };
                        };
			
                        vim.autocomplete.nvim-cmp.enable = true;
                        vim.snippets.luasnip.enable = true;
                        
                        vim.snippets.luasnip.providers = ["nvim-cmp" "luasnip" "friendly-snippets"];
                        vim.ui.borders.plugins.nvim-cmp.enable = true;

                        vim.statusline.lualine= {
				enable = true;
				theme = "gruvbox_dark";
			};

			vim.languages = {
                                enableTreesitter = true;
                                java = {
					enable = true;
					lsp.enable = true;
					treesitter.enable = true;
				};
				bash = {
					enable = true;
					lsp.enable = true;
					treesitter.enable = true;
				};
				clang = {
					enable = true;
					lsp.enable = true;
					treesitter.enable = true;
				};
				nix = {
					enable = true;
					lsp.enable = true;
                                        lsp.server = "nixd";
					treesitter.enable = true;
				};

			};

      			vim.viAlias = false;
      			vim.vimAlias = true;
      			
                        vim.theme={
                                name = "gruvbox";
                                enable = true;
                                style = "dark";
                        };




                        vim.options.signcolumn = "no";
                        vim.lineNumberMode = "none";
                        vim.treesitter.context.setupOpts.line_numbers = false;
    		};
	};
}
