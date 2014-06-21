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
(defvar my-packages '(starter-kit evil haskell-mode ghc markdown-mode auto-complete) "List of packages to be downloaded")
; TODO flymake-haskell-multi is not working at the moment for some reason (looks like MELPA's problem)

; running installation (pretty much like 'apt-get install')
(dolist (p my-packages) (when (not (package-installed-p p)) (package-install p)))


; TODO
(add-to-list 'load-path "~/.emacs.d/plugins/predictive")
(add-to-list 'load-path "~/.emacs.d/plugins/predictive/latex")
(autoload 'predictive-mode "predictive" "predictive" t)
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
; (require 'auto-complete)
; (global-auto-complete-mode t)

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

; Agda
; ====
(setq use-agda t)

(when use-agda
  (load-file (let ((coding-system-for-read 'utf-8))
                   (shell-command-to-string "agda-mode locate")))
  ; you'll definitely need this line to work both in evil-mode and agda-mode
  (add-hook 'agda2-mode-hook (lambda () (add-hook 'evil-insert-state-entry-hook (lambda () (set-input-method "Agda")))))

  ; you'll need to change this variable to your agda stdlib location
  ; you could just comment this line as well
  (add-hook 'agda2-mode-hook (lambda () (setq agda2-include-dirs (quote ("." "/L/soft/agda2-lib/lib-0.7/src")))))
)

; Haskell
; =======

; 'cabal install ghc-mod' to make it work
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))

(require 'haskell-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(add-to-list 'load-path "~/.emacs.d/plugins/emacs-haskell-unicode-input-method")

; Coq
; ===
(setq use-coq nil)

(when use-coq
  (load-file "/L/soft/ProofGeneral-4.2/generic/proof-site.el")
  (setq coq-prog-name "/L/soft/coq-8.4/bin/coqtop")
)

; C/C++
; =====

; (setq c-default-style "bsd" c-basic-offset 4)
; prevents c++ mode from indenting code in namespace definition
; that is, allows
; namespace myns
; {
; int somefun()... // this line will not be indented
; }
; (setq c-offsets-alist '((innamespace . [0])))

; (load-file "~/.emacs.d/google-c-style.el")
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)


; Markdown
; ========
(setq markdown-command "~/.emacs.d/scripts/markdown-wrapper.sh")
(require 'markdown-mode)
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(setq markdown-enable-math t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
