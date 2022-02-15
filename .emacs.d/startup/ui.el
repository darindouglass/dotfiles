;; Turn off the menu bar at the top of each frame because it's distracting
(menu-bar-mode -1)
(blink-cursor-mode 0)

(defalias 'yes-or-no-p 'y-or-n-p)

;; full path in title bar
(setq-default frame-title-format "%b (%f)")

;; Don't show native OS scroll bars for buffers because they're redundant
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; Show line numbers
(global-display-line-numbers-mode)

;; Enable beacon everywhere
;;(beacon-mode 1)

(setq ring-bell-function 'ignore)

;; ITERM2 MOUSE SUPPORT
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (defun track-mouse (e))
  (setq mouse-sel-mode t))

(setq base16-theme-256-color-source "colors")
;; themes
;; (use-package base16-theme
;;   :ensure t
;;   :config (load-theme 'base16-eighties t))
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;; (add-to-list 'load-path "~/.emacs.d/themes")
(load-theme 'sanityinc-tomorrow-eighties t)
;; ;;(load-theme 'sanityinc-tomorrow-eighties t)

(use-package powerline
  :ensure t
  :config (powerline-default-theme))
