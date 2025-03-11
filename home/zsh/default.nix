{
  lib,
  pkgs,
  ...
}:
{
  # generally looks just straight up awful... DO NOT USE!!!
  catppuccin.zsh-syntax-highlighting.enable = lib.mkForce false;
  programs.zsh = {
    enable = true;

    initExtraFirst = builtins.readFile ./init.zsh;
    # you can add your own private init stuff to ~/private.zsh
    # just in case you don't want to share with the class :)
    initExtra = ''
      [[ ! -f ${./extra.zsh} ]] || source ${./extra.zsh}
      [[ ! -f ~/.private.zsh ]] || source ~/.private.zsh
      [[ ! -f ${./p10k.zsh} ]] || source ${./p10k.zsh}
    '';

    completionInit = "autoload -U compinit && compinit -i";

    autosuggestion = {
      enable = true;
      strategy = [
        "history"
        "completion"
      ];
    };

    history = {
      size = 10000;
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.zsh-syntax-highlighting;
        file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
      }
      {
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions;
        file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
      }
      {
        name = "zsh-completions";
        src = pkgs.zsh-completions;
        file = "share/zsh-completions/zsh-completions.zsh";
      }
      {
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab;
        file = "share/fzf-tab/fzf-tab.plugin.zsh";
      }
    ];

    shellAliases = {
      lg = "lazygit";
      ls = "eza";
      l = "eza -blaoTL 1";
      sizeof = "du -hd 0";
      nix-develop = "nix develop -c zsh";
      nsp = "nix-shell --run zsh -p";
      statix-check = "statix check . --ignore hardware-configuration.nix";
      statix-fix = "statix fix . --ignore hardware-configuration.nix";
      cd = "z";
      rgc = "rg -nC 3";
    };
  };
}
