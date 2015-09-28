
;; Spell check
(setq ispell-program-name "/usr/local/bin/aspell")
(setq ispell-extra-args '("--sug-mode=ultra"))
(global-set-key (kbd "<f8>") 'ispell-word)


(setq org-log-done t
      org-todo-keywords '((sequence "TODO" "INPROGRESS" "DONE"))
      org-todo-keyword-faces '(("INPROGRESS" . (:foreground "blue" :weight bold))))
(add-hook 'org-mode-hook
          (lambda ()
            (flyspell-mode)))
(add-hook 'org-mode-hook
          (lambda ()
            (writegood-mode)))

;; TODO: apperance
(provide 'wil-org-mode)
