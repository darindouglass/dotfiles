;; Automatically load paredit when editing a lisp file
;; More at http://www.emacswiki.org/emacs/ParEdit
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'clojure-mode-hook           #'enable-paredit-mode)
(add-hook 'cider-mode-hook           #'enable-paredit-mode)
(add-hook 'cider-repl-mode-hook     #'enable-paredit-mode)

(global-set-key (kbd "M-o") 'next-multiframe-window)
(global-set-key (kbd "M-O") 'previous-multiframe-window)

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
(global-set-key (kbd "C-o C-e") 'cider-eval-last-sexp)
(global-set-key (kbd "C-o C-g") 'keyboard-quit)
(global-set-key (kbd "C-o C-j") 'cider-jack-in)
(global-set-key (kbd "C-o C-c") 'cider-connect)
(global-set-key (kbd "C-o C-k") 'cider-repl-clear-buffer)
(global-set-key (kbd "C-o C-n") 'goto-last-change)
(global-set-key (kbd "C-o C-p") 'goto-last-change-reverse)
(global-set-key (kbd "C-o C-r") 'code-review-forge-pr-at-point)
(add-hook 'paredit-mode-hook
          (lambda ()
             (global-set-key (kbd "C-o C-r") 'paredit-forward-slurp-sexp)
             (global-set-key (kbd "C-o C-l") 'paredit-forward-barf-sexp)
             (global-set-key (kbd "C-o C-M-r") 'paredit-backward-slurp-sexp)
             (global-set-key (kbd "C-o C-M-l") 'paredit-backward-barf-sexp)))

(use-package flycheck-inline
  :ensure t
  :init ;;(add-hook 'flycheck-mode-hook #'flycheck-inline-mode)
  )

(use-package flycheck-color-mode-line
  :ensure t
  :init (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

;; (setq flycheck-inline-display-function
;;       (lambda (msg pos err)
;;         (quick-peek-show msg pos))
;;       ;; (lambda (msg pos err)
;;       ;;   (let* ((ov (quick-peek-overlay-ensure-at pos))
;;       ;;          (contents (quick-peek-overlay-contents ov)))
;;       ;;     (setf (quick-peek-overlay-contents ov)
;;       ;;           (concat contents (when contents "\n") msg))
;;       ;;     (quick-peek-update ov)))
;;       flycheck-inline-clear-function #'quick-peek-hide)
