
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

(setq load-prefer-newer t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (powerline)))
 '(python-check-command "/usr/local/bin/pyflakes"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-document-title ((t (:foreground "pale turquoise" :weight bold :height 2.0))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.5))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.3))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.2)))))
(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))

(require 'package)
(package-initialize)


(require 'wil-utils)
(require 'wil-org-mode)
(require 'wil-cpp)
(require 'wil-smartcopy)
(require 'wil-ido)
(require 'wil-python)
;; (require 'wil-haskell)


