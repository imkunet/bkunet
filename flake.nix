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
}
