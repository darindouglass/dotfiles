(add-to-list 'load-path "~/.emacs.d/startup")
(load "packages.el")
(load "editing.el")
(load "navigation.el")
(load "ui.el")
(load "git.el")
(load "coding.el")
(load "sql-stuff.el")

(require 'cl)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-clojure-cli-aliases "test:dev")
 '(custom-safe-themes
   '("cea3ec09c821b7eaf235882e6555c3ffa2fd23de92459751e18f26ad035d2142" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" "9be1d34d961a40d94ef94d0d08a364c3d27201f3c98c9d38e36f10588469ea57" "760ce657e710a77bcf6df51d97e51aae2ee7db1fba21bbad07aab0fa0f42f834" "e1498b2416922aa561076edc5c9b0ad7b34d8ff849f335c13364c8f4276904f0" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default))
 '(flycheck-display-errors-delay 1.0)
 '(package-selected-packages
   '(diff-hl indent-guide indent-guide-mode zoom dockerfile-mode code-review forge terraform-mode yaml-mode quick-peek flycheck color-theme-sanityinc-tomorrow beacon smex rainbow-delimiters paredit magit cider))
 '(quick-peek-add-spacer t)
 '(quick-peek-position 'below)
 '(safe-local-variable-values
   '((cider-clojure-cli-global-options . "-A:test:cider")
     (eval add-hook 'after-save-hook #'cljstyle)
     (eval defun cljstyle nil
           (when
               (or
                (eq major-mode 'clojure-mode)
                (eq major-mode 'clojurescript-mode))
             (shell-command-to-string
              (format "cljstyle fix %s" buffer-file-name))
             (revert-buffer :ignore-auto :noconfirm)))
     (eval message "%s" "Loading cljstyle hook for clojure and clojurescript mode")))
 '(whitespace-line-column 110)
 '(zoom-mode t nil (zoom))
 '(zoom-size '(0.618 . 0.618)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
