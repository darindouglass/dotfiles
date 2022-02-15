(global-set-key (kbd "C-x g") 'magit-status)

(defun add-ticket-number ()
  (let* ((branch (or (magit-get-current-branch) ""))
         (parts (split-string branch "-"))
         (ticket-prefix (first parts))
         (ticket-number (second parts)))
    (when (and ticket-prefix (string-match "^[A-Za-z]+$" ticket-prefix)
               ticket-number (string-match "^[0-9]+$" ticket-number)
               (save-excursion (goto-char (point-min)) (eolp)))
      (goto-char (point-min))
      (insert "[" (upcase ticket-prefix) "-" ticket-number "] " ?\n)
      (previous-line)
      (end-of-line))))

(defun configure-fill-column ()
  (set-fill-column 72))

(defun enable-column-number-mode ()
  (column-number-mode t))

(eval-after-load 'magit
  '(defadvice magit-log-edit-toggle-amending (before clear-ticket activate)
     (delete-region (point-min) (point-max))))

(add-hook 'magit-log-edit-mode-hook 'add-ticket-number)
(add-hook 'magit-log-edit-mode-hook 'configure-fill-column)
(add-hook 'magit-log-edit-mode-hook 'enable-column-number-mode)
(add-hook 'git-commit-mode-hook 'add-ticket-number)
(add-hook 'git-commit-mode-hook 'configure-fill-column)
(add-hook 'git-commit-mode-hook 'enable-column-number-mode)

(use-package forge
  :ensure t
  :after magit)

(use-package code-review
  :ensure t
  :after forge)
