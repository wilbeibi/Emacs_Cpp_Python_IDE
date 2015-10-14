(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(require 'yasnippet)
(yas-global-mode 1)

(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/7.0.0/include")
)

(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

;; C-c ; to multi edit
(define-key global-map (kbd "C-c ;") 'iedit-mode)

;; sudo pip install cpplint, get path of cpplint
(defun my:flymake-google-init () 
  (require 'flymake-google-cpplint)
  (custom-set-variables
   '(flymake-google-cpplint-command "/usr/local/bin/cpplint"))
  (flymake-google-cpplint-load)
)

(add-hook 'c-mode-hook 'my:flymake-google-init)
(add-hook 'c++-mode-hook 'my:flymake-google-init)

;; google-c-style
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; Semantic
(semantic-mode 1)
(defun my:add-semantic-to-autocomplete() 
  (add-to-list 'ac-sources 'ac-source-semantic)
)
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)
;; turn on ede mode 
(global-ede-mode 1)
(global-semantic-idle-scheduler-mode 2)

(defadvice push-mark (around semantic-mru-bookmark activate)
  "Push a mark at LOCATION with NOMSG and ACTIVATE passed to `push-mark'.
If `semantic-mru-bookmark-mode' is active, also push a tag onto
the mru bookmark stack."
  (semantic-mrub-push semantic-mru-bookmark-ring
                      (point)
                      'mark)
  ad-do-it)

(defun semantic-ia-fast-jump-back ()
  (interactive)
  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
      (error "Semantic Bookmark ring is currently empty"))
  (let* ((ring (oref semantic-mru-bookmark-ring ring))
         (alist (semantic-mrub-ring-to-assoc-list ring))
         (first (cdr (car alist))))
    (if (semantic-equivalent-tag-p (oref first tag) (semantic-current-tag))
        (setq first (cdr (car (cdr alist)))))
    (semantic-mrub-switch-tags first)))

;;(global-set-key [f12] 'semantic-ia-fast-jump)
;;(global-set-key [S-f12] 'semantic-ia-fast-jump-back)

;; http://emacser.com/built-in-cedet.htm
(defun semantic-ia-fast-jump-or-back (&optional back)
  (interactive "P")
  (if back
      (semantic-ia-fast-jump-back)
    (semantic-ia-fast-jump (point))))
(define-key semantic-mode-map [f12] 'semantic-ia-fast-jump-or-back)
(define-key semantic-mode-map [C-f12] 'semantic-ia-fast-jump-or-back)
(define-key semantic-mode-map [S-f12] 'semantic-ia-fast-jump-back)

;; (global-set-key [S-f12]
;;                 (lambda ()
;;                   (interactive)
;;                   (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
;;                       (error "Semantic Bookmark ring is currently empty"))
;;                   (let* ((ring (oref semantic-mru-bookmark-ring ring))
;;                          (alist (semantic-mrub-ring-to-assoc-list ring))
;;                          (first (cdr (car alist))))
;;                     (if (semantic-equivalent-tag-p (oref first tag)
;;                                                    (semantic-current-tag))
;;                         (setq first (cdr (car (cdr alist)))))
;;                     (semantic-mrub-switch-tags first))))


(provide 'wil-cpp)
