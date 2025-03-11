{
  description = "bkunet - be kunet";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { ... }:
    {
      homeManagerModules.bkunet = import ./home;
    };

  # you probably want these lines in your flake.nix
  nixConfig = {
    extra-substituters = [
      "https://cache.nixos.org"
      "https://catppuccin.cachix.org"
      "https://nix-community.cachix.org"
      "https://nixvim.cachix.org"
      "https://statix.cachix.org"
    ];

    extra-trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "catppuccin.cachix.org-1:noG/4HkbhJb+lUAdKrph6LaozJvAeEEZj4N732IysmU="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "nixvim.cachix.org-1:8xrm/43sWNaE3sqFYil49+3wO5LqCbS4FHGhMCuPNNA="
      "statix.cachix.org-1:Z9E/g1YjCjU117QOOt07OjhljCoRZddiAm4VVESvais="
    ];
  };
}
