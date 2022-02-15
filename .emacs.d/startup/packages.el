(require 'package)
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(magit . "melpa-stable") t)

(package-initialize)
(package-refresh-contents)

(defvar packages-to-install
  '(;;beacon
    cider
    clojure-mode
    ;; color-theme-sanityinc-tomorrow
    company
    flycheck
    ido-completing-read+
    lsp-mode
    lsp-treemacs
    magit
    nix-mode
    paredit
    rainbow-delimiters
    smex
    use-package))

(dolist (p packages-to-install)
  (when (not (package-installed-p p))
    (package-install p)))
