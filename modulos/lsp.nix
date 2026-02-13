{pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
		nixd
		luajitPackages.lua-lsp
		ccls
		pyright
		jdt-language-server
		ripgrep
	];
  

}
