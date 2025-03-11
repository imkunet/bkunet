{
  imports = [
    ./nixvim
    ./zsh
    ./programs.nix
  ];

  home = {
    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  catppuccin.enable = true;
}
