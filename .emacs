;; Backup stuff
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;; History stuff
(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode 1)
(setq history-length t)
(setq history-delete-duplicates t)
(setq savehist-save-minibuffer-history 1)
(setq savehist-additional-variables
      '(kill-ring
        search-ring
        regexp-search-ring))

;; Themes
(require 'package)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(load-theme 'ample t t)
(load-theme 'ample-flat t t)
(load-theme 'ample-light t t)
(load-theme 'ample-zen t)

(enable-theme 'ample-zen)

;; Misc
(server-start)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-hook 'prog-mode-hook 'linum-mode)
(line-number-mode 1)
(column-number-mode 1)

;; Spaces, not tabs
(setq-default indent-tabs-mode nil)
(setq tab-width 4)

;; Whitespace
(global-whitespace-mode 1)
(setq whitespace-style '(face lines-tail trailing empty indentation))

;; Auto-generated
(custom-set-variables
     '(inhibit-startup-screen t)
     '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))))
(custom-set-faces)
