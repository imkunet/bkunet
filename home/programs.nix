{ pkgs, ... }:
{
  home.packages = with pkgs; [
    age
    aria2
    curlHTTP3
    diffutils
    dua
    glow
    gum
    jq
    libqalculate
    nil
    nixd
    nixfmt-rfc-style
    statix
    treefmt
    unzip
    yq-go
  ];

  programs = {
    bat.enable = true;
    btop = {
      enable = true;
      settings = {
        theme_background = true;
        update_ms = 1000;
        proc_sorting = "cpu direct";
      };
    };
    git.delta = {
      enable = true;
    };
    direnv = {
      enable = true;
      nix-direnv.enable = true;
      silent = true;
    };
    eza = {
      enable = true;
      icons = "auto";
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    git = {
      enable = true;
      lfs.enable = true;
      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = true;
      };
    };
    lazygit = {
      enable = true;
      settings = {
        gui = {
          nerdFontsVersion = "3";
        };
        git = {
          paging = {
            colorArg = "always";
            pager = "delta --paging=never";
          };
        };
      };
    };
    ripgrep = {
      enable = true;
      arguments = [
        "--colors=line:style:bold"
        "--smart-case"
      ];
    };
    tmux = {
      enable = true;
      mouse = true;
      keyMode = "vi";
      shortcut = "a";
      plugins = with pkgs.tmuxPlugins; [
        sensible
        better-mouse-mode
      ];
      shell = "${pkgs.zsh}/bin/zsh";
    };
    zoxide = {
      enable = true;
    };
  };
}
