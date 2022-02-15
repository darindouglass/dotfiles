(use-package lsp-mode
  :ensure t
  :hook ((clojure-mode . lsp)
         (clojurec-mode . lsp)
         (clojurescript-mode . lsp)
         (python-mode . lsp))
  :config
  ;; add paths to your local installation of project mgmt tools, like lein
  (setenv "PATH" (concat
                   "/usr/local/bin" path-separator
                   (getenv "PATH")))
  (dolist (m '(clojure-mode
               clojurec-mode
               clojurescript-mode
               clojurex-mode))
     (add-to-list 'lsp-language-id-configuration `(,m . "clojure"))))

;; (use-package company-jedi
;;   :ensure t)

;; (defun my/python-mode-hook ()
;;   (add-to-list 'company-backends 'company-jedi))

;; (add-hook 'python-mode-hook 'my/python-mode-hook)

;; (use-package lsp-jedi
;;   :ensure t
;;   :config
;;   (with-eval-after-load "lsp-mode"
;;     (add-to-list 'lsp-disabled-clients 'pyls)
;;     (add-to-list 'lsp-enabled-clients 'jedi)))
;; (with-eval-after-load "lsp-mode"
;;   (add-to-list 'lsp-disabled-clients 'pyls)
;;   (add-to-list 'lsp-enabled-clients 'pylsp))

(add-hook 'clojure-mode-hook 'lsp)
(add-hook 'clojurescript-mode-hook 'lsp)
(add-hook 'clojurec-mode-hook 'lsp)
(add-hook 'python-mode-hook 'lsp)

(global-set-key (kbd "C-o C-o") 'lsp-execute-code-action)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-minimum-prefix-length 1
      ; disable cider showing eldoc during symbol at point
      cider-eldoc-display-for-symbol-at-point nil
      lsp-lens-enable t
      lsp-signature-auto-activate nil
      lsp-headerline-breadcrumb-enable nil
      lsp-ui-sideline-enable t
      ; lsp-enable-indentation nil ; uncomment to use cider indentation instead of lsp
      ; lsp-enable-completion-at-point nil ; uncomment to use cider completion instead of lsp
      flycheck-flake8-maximum-line-length 110)

(setq flycheck-flake8-maximum-line-length 110)
