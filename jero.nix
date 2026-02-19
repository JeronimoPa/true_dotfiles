{ pkgs,lib ,... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "jeronimo";
  home.homeDirectory = "/home/jeronimo";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.
  #consola y configuración
  nixpkgs.config.allowUnfree = true;
  programs.kitty = {
	enable = true;
	font = {
		name = "ProggyClean Nerd Font";
		size = 32;
	};
	settings = {
		confirm_os_window_close=0;
		#shell = "${pkgs.bash}";
	};
	#enableBashIntegration = false;
  };
	gtk = {
		enable = true;
		theme = {
			name = "Adwaita-dark";
			package = pkgs.gnome-themes-extra;
		};
		iconTheme = {
			name = "Papirus-Dark";
			package = pkgs.papirus-icon-theme;
		};
		cursorTheme = {
			name = "Bibata-Modern-Ice";
			package = pkgs.bibata-cursors;
			size = 24;
		};
	};	
  programs.bash =
  {
  	enable = true;
	initExtra = ''
      if [[ -n "$KITTY_WINDOW_ID" && $SHLVL -eq 1 ]]; then
        eval "$(starship init bash)"
      fi
    '';
  };

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
		nixd					#nix
		luajitPackages.lua-lsp	#lua
		ccls					#c y cpp
		pyright					#python
		jdt-language-server		#java
		omnisharp-roslyn		#unity


		ripgrep					#para live_grep
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
  #programs.ahoviewer,
	#programs.starship =
	#{
		#enable = true;
	#};
  programs.git={
  	enable = true;
	settings = {
			user.email = "jeropan04@gmail.com";
			user.name = "Negrozma";
			pull.rebase = true;        # git pull uses rebase
			rebase.autoStash = true;   # stash automatically during rebase
		};
	};
  # The home.packages option allows you to install Nix packages into your
  # environment.
  #xsession.windowManager.bspwm={
  #	enable = true;
  #};

  home.packages = with pkgs; [
	
	appflowy
  	#resource monitor:
	btop
	#file manager
	ranger
	#resource bar
	polybar
	#image viewer
	feh
	#si no lo pongo no funciona
	sxhkd
	#dmenu
	rofi
	rofi-games
	rofi-power-menu

	#theming for apps
	  gnome-themes-extra
	  adwaita-icon-theme
	  papirus-icon-theme
	#tetrio-plus
  	tetrio-desktop
	winetricks
  ];
  
  xdg.configFile."bspwm/bspwmrc".source = lib.mkForce ./modulos/bspwm/bspwmrc;
  xdg.configFile."starship.toml".source = lib.mkForce ./modulos/bspwm/starship.toml;

 # xsession.enable = true;
  xsession.windowManager.bspwm.enable = true;
 
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    #".config/bspwm/bspwmrc".source = 		./modulos/bspwm/bspwmrc;
    #".config/nvim".source = 			./modulos/nvim;
    #".config/nvim".recursive = true;
    ".config/sxhkd/sxhkdrc".source = 		./modulos/bspwm/sxhkdrc;
    ".config/polybar/config.ini".source = 	./modulos/bspwm/externo.ini;
    ".config/rofi".source = 			./modulos/bspwm/rofi;
    ".config/picom/picom.conf".source =		./modulos/bspwm/picom.conf;   
    ".config/MangoHud/MangoHud.conf".source =	./modulos/bspwm/MangoHud.conf;		
    #"wallpaper.png".source = ./modulos/bspwm/wallpaper.png;



  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/jeronimo/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
    MANGOHUD_CONFIGFILE="$HOME/.config/MangoHud/MangoHud.conf";
	RPCS3_DATA_DIR="$(dirname $(dirname $(readlink -f $(command -v rpcs3))))/share/rpcs3";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
