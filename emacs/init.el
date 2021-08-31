;; Load specialized-customizations
(add-to-list 'load-path "~/.emacs.d/customizations")
(load "init-package.el")
(load "editing.el")
(load "shell-integration.el")
(load "navigation.el")
(load "ui.el")
(load "misc.el")
(load "elisp-editing.el")
(load "setup-clojure.el")

;; ITERM2 MOUSE SUPPORT
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (defun track-mouse (e))
  (setq mouse-sel-mode t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-auto-select-error-buffer nil)
 '(cider-auto-test-mode nil)
 '(cider-repl-display-help-banner nil)
 '(cider-repl-history-file "~/.emacs.d/cider-history")
 '(cider-repl-wrap-history t)
 '(custom-safe-themes
   '("a0be7a38e2de974d1598cf247f607d5c1841dbcef1ccd97cded8bea95a7c7639" "745d03d647c4b118f671c49214420639cb3af7152e81f132478ed1c649d4597d" "47db50ff66e35d3a440485357fb6acb767c100e135ccdf459060407f8baea7b2" "a82ab9f1308b4e10684815b08c9cac6b07d5ccb12491f44a942d845b406b0296" "7a7b1d475b42c1a0b61f3b1d1225dd249ffa1abb1b7f726aec59ac7ca3bf4dae" "1a52e224f2e09af1084db19333eb817c23bceab5e742bf93caacbfea5de6b4f6" "6c386d159853b0ee6695b45e64f598ed45bd67c47f671f69100817d7db64724d" "cf08ae4c26cacce2eebff39d129ea0a21c9d7bf70ea9b945588c1c66392578d1" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "9e39a8334e0e476157bfdb8e42e1cea43fad02c9ec7c0dbd5498cf02b9adeaf1" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "5ee12d8250b0952deefc88814cf0672327d7ee70b16344372db9460e9a0e3ffc" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "9e54a6ac0051987b4296e9276eecc5dfb67fdcd620191ee553f40a9b6d943e78" default))
 '(package-selected-packages
   '(doom-themes markdown-mode use-package dockerfile-mode yaml-mode powerline flycheck-clj-kondo flycheck dash-at-point magit rainbow-delimiters smex ido-ubiquitous cider clojure-mode-extra-font-locking clojure-mode paredit))
 '(safe-local-variable-values
   '((cider-shadow-cljs-default-options . "app")
     (cider-boot-parameters . "api app test-paths repl -s wait")
     (groovy-indent-offset . 2)))
 '(whitespace-line-column 110))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
