(paredit-mode)

(global-set-key (kbd "M-o") 'next-multiframe-window)
(global-set-key (kbd "M-O") 'previous-multiframe-window)

;; Linting setup
(require 'flycheck-color-mode-line)
;; (require 'powerline)
;; (require 'quick-peek)

;; (powerline-default-theme)
(add-hook 'after-init-hook #'global-flycheck-mode)
(eval-after-load "flycheck" '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

;; (with-eval-after-load 'flycheck
;;   (add-hook 'flycheck-mode-hook #'flycheck-inline-mode))

;;(remove-hook 'flycheck-mode-hook #'flycheck-inline-mode)

;; (setq flycheck-inline-display-function
;;       (lambda (msg pos)
;;         (let* ((ov (quick-peek-overlay-ensure-at pos))
;;                (contents (quick-peek-overlay-contents ov)))
;;           (setf (quick-peek-overlay-contents ov)
;;                 (concat contents (when contents "\n") msg))
;;           (quick-peek-update ov)))
;;       flycheck-inline-clear-function #'quick-peek-hide)
;; (setq flycheck-inline-display-function identity)

;; Expansion
(global-set-key (kbd "M-/") 'hippie-expand)
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

(show-paren-mode 1)
(global-hl-line-mode 1)

;; searching
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(setq-default indent-tabs-mode nil)

(require 'dired-x)

;; When you visit a file, point goes to the last place where it
;; was when you previously visited the same file.
;; http://www.emacswiki.org/emacs/SavePlace
(require 'saveplace)
(setq-default save-place t)
;; keep track of saved places in ~/.emacs.d/places
(setq save-place-file (concat user-emacs-directory "places"))

;; Emacs can automatically create backup files. This tells Emacs to
;; put all backups in ~/.emacs.d/backups. More info:
;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Backup-Files.html
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))
(setq auto-save-default nil)

(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
(global-set-key (kbd "C-;") 'toggle-comment-on-line)

;; yay rainbows!
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; use 2 spaces for tabs
(defun die-tabs ()
  (interactive)
  (set-variable 'tab-width 2)
  (mark-whole-buffer)
  (untabify (region-beginning) (region-end))
  (keyboard-quit))

;; fix weird os x kill error
(defun ns-get-pasteboard ()
  "Returns the value of the pasteboard, or nil for unsupported formats."
  (condition-case nil
      (ns-get-selection-internal 'CLIPBOARD)
    (quit nil)))

(setq electric-indent-mode nil)

;; Whitespace detection
;; Whitespace
(global-whitespace-mode 1)
(setq whitespace-style (quote (face trailing tab-mark lines-tail empty)))

;; C-o prefix
(global-unset-key (kbd "C-o"))
(defun scg-enable-prefix ()
  (local-unset-key (kbd "C-o")))
(add-hook 'dired-mode-hook 'scg-enable-prefix)
(global-set-key (kbd "C-o C-g") 'keyboard-quit)
(global-set-key (kbd "C-o C-o") 'open-line)
(global-set-key (kbd "C-o C-j") 'cider-jack-in)
(global-set-key (kbd "C-o C-c") 'cider-connect)
(global-set-key (kbd "C-o C-k") 'cider-repl-clear-buffer)
(global-set-key (kbd "C-o C-n") 'goto-last-change)
(global-set-key (kbd "C-o C-p") 'goto-last-change-reverse)
(add-hook 'paredit-mode-hook
          (lambda ()
             (global-set-key (kbd "C-o C-r") 'paredit-forward-slurp-sexp)
             (global-set-key (kbd "C-o C-l") 'paredit-forward-barf-sexp)
             (global-set-key (kbd "C-o C-M-r") 'paredit-backward-slurp-sexp)
             (global-set-key (kbd "C-o C-M-l") 'paredit-backward-barf-sexp)))

;; install markdown-mode
(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))
