;; python
(pyenv-mode)
(elpy-enable)

(add-hook 'python-mode-hook 'subword-mode)
(add-hook 'python-mode-hook '(lambda () (setq python-indent 4)))
