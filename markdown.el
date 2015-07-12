; Markdown
; ========
(setq markdown-command "~/.emacs.d/scripts/markdown-wrapper.sh")
(require 'markdown-mode)
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(setq markdown-enable-math t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))