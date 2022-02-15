{ config, lib, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    escapeTime = 0;
    baseIndex = 1;
    shortcut = "z";
    aggressiveResize = true;
    historyLimit = 30000;
    terminal = "xtmer-256color";

    # Replaces ~/.tmux.conf
    extraConfig = ''
      set-option -g mouse on
      set-option -ga terminal-overrides ",xterm-256color:Tc"

      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"

      bind Escape copy-mode
    '';
  };
}
