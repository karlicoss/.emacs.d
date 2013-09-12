; Packages and bootstrapping
; ==========================

; package module is required for emacs' packages manipulation
; it should be built-in in you distro emacs installation
(require 'package)
; melpa is one of the package repositories for emacs packages
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

; updating packages index (pretty like 'apt-get update')
(when (not package-archive-contents) (package-refresh-contents))

; we define a list of packages to install
(defvar my-packages '(starter-kit evil auto-complete) "List of packages to be downloaded")

; running installation (pretty much like 'apt-get install')
(dolist (p my-packages) (when (not (package-installed-p p)) (package-install p)))

; Some useful stuff
; =================

; line numbers
(global-linum-mode t)

; show matching parentheses
(show-paren-mode t)

; words auto completion
(require 'auto-complete)
(global-auto-complete-mode t)

; enables interaction with system clipboard
(setq x-select-enable-clipboard t)

; highly recommended since default Ubuntu monospace font does not
; render unicode properly
(set-default-font "DejaVu Sans Mono-12")


; Agda
; ====
; 'cabal install Agda' first and add .cabal/bin to the PATH

(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))

; uncomment this line and set path to your Agda stdlib location
; (add-hook 'agda2-mode-hook (lambda () (setq agda2-include-dirs (quote ("." "/L/soft/agda2-lib")))))

; Evil
; ====
 
; (require 'evil)
; (evil-mode t)

; ; you'll definitely need this line to work both in evil-mode and agda-mode
; (add-hook 'agda2-mode-hook (lambda () (add-hook 'evil-insert-state-entry-hook (lambda () (set-input-method "Agda")))))
