;; emacs term ;;

;; setup ansi-color
(autoload 'ansi-color-for-comint-mode-on "ansi-color"
          "Set `ansi-color-for-comint-mode' to t." t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Use Emacs terminfo, not system terminfo
;; tic -o ~/.terminfo /usr/share/emacs/24.3/etc/e/eterm-color.ti
(setq system-uses-terminfo nil)

;; http://www.emacswiki.org/emacs/MultiTerm
(when (require 'multi-term nil t)
  (global-set-key [f1] 'multi-term)
  (global-set-key (kbd "C-c n") 'multi-term-next)
  (global-set-key (kbd "C-c p") 'multi-term-prev)
      (setq multi-term-buffer-name "eterm"
      multi-term--program "/bin/zsh"))

;; Turn off current-line-highlighting and auto-pair.
(defadvice term-char-mode (after term-char-mode-fixes ())
;;(autopair-mode -1)
  (set (make-local-variable 'hl-line-mode) nil)
  (set (make-local-variable 'global-hl-line-mode) nil))
(ad-activate 'term-char-mode)

;; fix copy/paste
(add-hook
 'term-mode-hook
 (lambda ()
   (define-key term-raw-map (kbd "C-y") 'term-paste)
   (define-key term-raw-map (kbd "C-v") 'term-paste)
   (define-key term-raw-map (kbd "s-v") 'term-paste)))

;; unlimited terminal buffer
(add-hook 'term-mode-hook
          (lambda ()
            (setq term-buffer-maximum-size 0)))

(provide 'init-setupterm)
