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