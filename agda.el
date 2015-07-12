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