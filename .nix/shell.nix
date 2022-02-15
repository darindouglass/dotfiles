# Shell configuration for zsh (frequently used)

{ config, lib, pkgs, ... }:

let
  # Set all shell aliases programatically
  shellAliases = {
    # Aliases for commonly used tools
    alg = "alias -p | grep";
    cl = "clear";
    # diff = "diff --color=auto";
    l = "exa -alhuU --git";
    ll = "ls -lh";
    ls = "exa";
    psg = "ps aux | grep";
    tv = "cat ~/.tool-versions";

    dbash = "docker run -it --entrypoint bash";

    # kubectl aliases
    # k = "kubectl";
    # kg = "kubectl get";
    # kgp = "kubectl get pods";
    # kd = "kubectl describe";
    # keti = "kubectl exec -it";
    # klf = "k log -f";
    wp = "watch kubectl get pods";

    # Only use terminal emacs
    emacs = "emacs -nw";

    # Nix / shell-related stuff
    garbage = "nix-collect-garbage -d && docker image prune --force"; # Nix garbage collection
    installed = "nix-env --query --installed"; # See which Nix packages are installed
    reload = "home-manager switch && source ~/.zshrc"; # Reload home manager and zsh
    szsh = "source ~/.zshrc"; # Reload zsh
    t = "tmux -2 new-session -ADs";
  };
in {
  # zsh settings
  programs.zsh = {
    inherit shellAliases;
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    history.extended = true;

    # Called whenever zsh is initialized
    initExtra = ''
      export TERM="xterm-256color"
      bindkey -e

      # Nix setup (environment variables, etc.)
      if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
        . ~/.nix-profile/etc/profile.d/nix.sh
      fi

      # Load environment variables from a file; this approach allows me to not
      # commit secrets like API keys to Git
      if [ -e ~/.env ]; then
        . ~/.env
      fi

      if [ -e ~/.config/kubectl_aliases.zsh ]; then
        . ~/.config/kubectl_aliases.zsh
      fi

      alias ..="cd .."
      alias ...="cd ../.."
      alias ....="cd ../../.."

      # boo `cd`
      setopt auto_cd
      # better word delineation
      autoload -U select-word-style
      select-word-style bash

      export GPG_TTY=$(tty) # setup gpg per GitHub docs
      export MINIKUBE_IN_STYLE="false"; # get those emoji out of my terminal

      # Start up Starship shell
      eval "$(starship init zsh)"

      # Autocomplete for various utilities
      source <(kubectl completion zsh)
      source <(minikube completion zsh)

      # Load asdf
      . $HOME/.asdf/asdf.sh

      # Hook direnv into your shell.
      eval "$(direnv hook zsh)"
    '';
  };
}
