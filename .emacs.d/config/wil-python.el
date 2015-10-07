;; pip install elpy rope jedi
;; package install elpy
;; http://onthecode.com/post/2014/03/06/emacs-on-steroids-for-python-elpy-el.html
(elpy-enable)

;; Fixing a key binding bug in elpy
(define-key yas-minor-mode-map (kbd "C-c i") 'yas-expand)
;; Fixing another key binding bug in iedit mode
(define-key global-map (kbd "C-c o") 'iedit-mode)

(setenv "PYTHONPATH" "/usr/local/bin/python2")

;; fix pyflakes error
(custom-set-variables
 '(python-check-command "/usr/local/bin/pyflakes"))

;; Haskell
(add-hook 'haskell-mode-hook 'turn-on-haskell-unicode-input-method)
(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(provide 'wil-python)
