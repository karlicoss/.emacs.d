(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;                         ("marmalade" . "http://marmalade-repo.org/packages/")
;                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)


(when (not package-archive-contents) (package-refresh-contents))

(defvar my-packages '(starter-kit evil haskell-mode markdown-mode rainbow-delimiters auto-complete) "List of packages to be downloaded")

(dolist (p my-packages) (when (not (package-installed-p p)) (package-install p)))

(global-linum-mode t)

(require 'auto-complete)
(global-auto-complete-mode t)

(require 'evil)
(evil-mode 1)
(add-hook 'evil-insert-state-entry-hook (lambda () (set-input-method "Agda")))

(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))
(setq x-select-enable-clipboard t)
(menu-bar-mode 1)

(require 'haskell-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(add-to-list 'load-path "~/.emacs.d/plugins/emacs-haskell-unicode-input-method")
;(add-to-list 'load-path "~/.emacs.d/plugins/emacs-eclim-0.2")

;(require 'eclim)
;(require 'eclimd)
;(setq eclim-auto-save t)
;(global-eclim-mode)

;; regular auto-complete initialization
(require 'auto-complete-config)
(ac-config-default)

;; add the emacs-eclim source
;(require 'ac-emacs-eclim-source)
;(add-hook 'eclim-mode-hook (lambda ()
;                             (add-to-list 'ac-sources 'ac-source-emacs-eclim)
;                             (add-to-list 'ac-sources 'ac-source-emacs-eclim-c-dot)))

(require 'rainbow-delimiters)
(add-hook 'haskell-mode-hook 'rainbow-delimiters-mode)


(setq c-default-style "bsd" c-basic-offset 4)


(require 'markdown-mode)
;(require 'haskell-unicode-input-method)
;(add-hook 'haskell-mode-hook 
;  (lambda () (set-input-method "haskell-unicode")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;'(eclim-executable "/L/soft/eclipse-indigo/eclim")
 '(markdown-command "~/.emacs.d/scripts/markdown-wrapper.sh")
 '(markdown-enable-math t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

