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

  catppucchin.enable = true;
}
