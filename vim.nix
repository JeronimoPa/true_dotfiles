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
    extraPackages = with pkgs; [
		nixd							#nix
		luajitPackages.lua-lsp			#lua
		ccls							#c y cpp
		pyright							#python
		jdt-language-server				#java
		omnisharp-roslyn				#unity
		vscode-langservers-extracted	#web dev

		ripgrep							#para live_grep
    ];
    plugins = with pkgs.vimPlugins; [

      {
        plugin = nvim-lspconfig;
        config = toLuaFile ./modulos/nvim/plugin/lsp.lua;
      }

      {
        plugin = gruvbox-nvim;
        config = "colorscheme gruvbox";
      }

      neodev-nvim

      nvim-cmp 
      {
        plugin = nvim-cmp;
        config = toLuaFile ./modulos/nvim/plugin/cmp.lua;
      }

      {
        plugin = telescope-nvim;
        config = toLuaFile ./modulos/nvim/plugin/telescope.lua;
      }

      cmp_luasnip
      cmp-nvim-lsp

      luasnip
      friendly-snippets
	  
      {
        plugin = nvim-autopairs;
        config = toLuaFile ./modulos/nvim/plugin/autopair.lua;
      }

      {
        plugin = lualine-nvim;
        config = toLuaFile ./modulos/nvim/plugin/lualine.lua;
      }
      
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
        ]));
        config = toLuaFile ./modulos/nvim/plugin/treesitter.lua;
      }

      # {
      #   plugin = vimPlugins.own-onedark-nvim;
      #   config = "colorscheme onedark";
      # }
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./modulos/nvim/options.lua}
    '';

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
