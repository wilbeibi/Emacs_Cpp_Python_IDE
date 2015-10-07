;; package management


(require 'cl)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(setq package-archive-enable-alist '(("melpa" deft magit)))

(setq tab-width 4)
;; UI
(load-theme 'deeper-blue t)

;; Setting English Font
(set-face-attribute
 'default nil :font "Monaco 13")

;; Chinese font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset
                    (font-spec :family "PingFang SC" :size 13)))
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; mode line settings
(global-linum-mode t)
(column-number-mode t)
(size-indication-mode t)
(electric-pair-mode t)
(show-paren-mode 1)
;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; show buffer name
(setq frame-title-format "%b")

;; F2 Set mark
(global-set-key [(f2)] 'set-mark-command)
;; F5 goto line
(global-set-key [f5] 'goto-line)

;; Powerline
(require 'powerline)

(setq powerline-arrow-shape 'arrow14) ;; mirrored arrows

;; Make the window 90% opaque, transparent
(set-frame-parameter nil 'alpha 90)

;; OSX key binding
(setq mac-option-modifier 'none)
(setq mac-command-modifier 'meta)
(setq ns-function-modifier 'hyper)

;; ibuffer C-x C-b
;; p(reious), n(ext), m(ark), d(elete), e(dit), g(refresh)
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; deft
(setq deft-extension "org")
(setq deft-text-mode 'org-mode)
(setq deft-directory "~/Dropbox/Notes")
(setq deft-use-filename-as-title t)

(provide 'wil-utils)
