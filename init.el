; Packages and bootstrapping
; ==========================

; package module is required for emacs' packages manipulation
; it should be built-in in you distro emacs installation
(require 'package)
; melpa is one of the package repositories for emacs packages
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")))
(package-initialize)

; updating packages index (pretty like 'apt-get update')
(when (not package-archive-contents) (package-refresh-contents))

; we define a list of packages to install
(defvar my-packages '(starter-kit evil haskell-mode ghc markdown-mode auto-complete) "List of packages to be downloaded")
; TODO flymake-haskell-multi is not working at the moment for some reason (looks like MELPA's problem)

; running installation (pretty much like 'apt-get install')
(dolist (p my-packages) (when (not (package-installed-p p)) (package-install p)))


; TODO
; (add-to-list 'load-path "~/.emacs.d/plugins/predictive")
; (add-to-list 'load-path "~/.emacs.d/plugins/predictive/latex")
; (autoload 'predictive-mode "predictive" "predictive" t)
; (set-default 'predictive-auto-add-to-dict t)

; Some useful stuff
; =================
; (require 'predictive) TODO how to run by default? :(((
; (predictive-mode 1)
; (add-hook 'predictive-mode-hook 
; (global-set-key (kbd "TAB") 'completion-show-popup-tip) ; TODO predictive mode hook

; line numbers
(global-linum-mode t)

; auto update buffer on file change
(global-auto-revert-mode t)

; show matching parentheses
(show-paren-mode t)

; words auto completion
(require 'auto-complete)
(global-auto-complete-mode t)

; TODO what that one for?
; regular auto-complete initialization
; (require 'auto-complete-config)
; (ac-config-default)

; TODO
;
;(eval-after-load 'predictive-mode
;                 '(define-key 

; evil 
(require 'evil)
(evil-mode t)

; enables interaction with system clipboard
(setq x-select-enable-clipboard t)

; TODO what this thing for?
(menu-bar-mode 1)

; highly recommended since default Ubuntu monospace font does not
; render unicode properly
(set-default-font "DejaVu Sans Mono-12")


; (require 'whitespace)
; (setq whitespace-style '(face empty tabs lines-tail trailing))
; (global-whitespace-mode t)

(load-file "~/.emacs.d/agda.el")

(load-file "~/.emacs.d/haskell.el")

(load-file "~/.emacs.d/coq.el")

(load-file "~/.emacs.d/cpp.el")

(load-file "~/.emacs.d/markdown.el")