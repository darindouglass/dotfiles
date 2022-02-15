{ config, pkgs, ... }:

let
  # Import other Nix files
  imports = [
    ./shell.nix
    ./tmux.nix
    ./git.nix
  ];

  # Handly shell command to view the dependency tree of Nix packages
  depends = pkgs.writeScriptBin "depends" ''
    dep=$1
    nix-store --query --requisites $(which $dep)
  '';

  git-hash = pkgs.writeScriptBin "git-hash" ''
    nix-prefetch-url --unpack https://github.com/$1/$2/archive/$3.tar.gz
  '';

  wo = pkgs.writeScriptBin "wo" ''
    readlink $(which $1)
  '';

  run = pkgs.writeScriptBin "run" ''
    nix-shell --pure --run "$@"
  '';

  scripts = [
    depends
    git-hash
    run
    wo
  ];
in {
  inherit imports;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage
  home.username = "darin";
  home.homeDirectory = "/Users/darin";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";

  home.sessionVariables = {
    EDITOR = "emacsclient";
    #TERMINAL = "alacritty";
  };

  # Miscellaneous packages (in alphabetical order)
  home.packages = with pkgs; [
    # _1password
    autoconf # Broadly used tool, no clue what it does
    aws-vault
    # bpytop
    # this doens't install well on my machine for some reason
    # awscli2 # Amazon Web Services CLI
    circleci-cli
    # clj-kondo # this is old
    cloc
    # clojure-lsp
    curl # An old classic
    direnv
    emacs
    exa
    git-filter-repo
    graphviz # dot
    gnupg # gpg
    htop # Resource monitoring
    jq # JSON parsing for the CLI
    leiningen
    kafkacat
    kubectl # Kubernetes CLI tool
    minikube # Local Kubernetes
    pinentry_mac # Necessary for GPG
    postgresql
    rlwrap
    sops
    starship # Fancy shell that works with zsh
    # terraform
    # terragrunt
    tree # Should be included in macOS but it's not
    watch
    wget
  ] ++ scripts;
}
