{pkgs, config, ...}:
{
  #primera versión
  system.stateVersion = "24.11"; # Did you read the comment?
  #activar flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];
}
