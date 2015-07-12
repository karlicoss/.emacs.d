; Haskell
; =======

; 'cabal install ghc-mod' to make it work
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))

(require 'haskell-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(add-to-list 'load-path "~/.emacs.d/plugins/emacs-haskell-unicode-input-method")