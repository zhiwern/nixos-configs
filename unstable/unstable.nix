# For unstable packages
# Remember to add the remote unstable nix branch and name it as <unstable> via the nix-channel command line
{ config, pkgs, ... }:

let
  unstable = import <unstable> { config = { allowUnfree = true; }; };
in {
  environment.systemPackages = with pkgs; [
    unstable.zed-editor
  ];
}
