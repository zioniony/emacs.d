;;; localcodes --- local codes
;;; Commentary:
;;; Code:

;;; load packages
(require 'init-setupterm)
(require 'cal-china-x)
(setq mark-holidays-in-calendar t
	  cal-china-x-important-holidays cal-china-x-chinese-holidays
	  calendar-holidays cal-china-x-important-holidays)
(require 'ess-site)

;; (autoload 'sawfish-mode "sawfish" "sawfish-mode" t)
;; (setq auto-mode-alist (cons '("\\.sawfishrc$"  . sawfish-mode) auto-mode-alist)
;;       auto-mode-alist (cons '("\\.jl$"         . sawfish-mode) auto-mode-alist)
;;       auto-mode-alist (cons '("\\.sawfish/rc$" . sawfish-mode) auto-mode-alist))

(when (fboundp 'purty-mode)
  (purty-mode))

(setq display-time-format "%Y-%m-%d %H:%M")
(display-time-mode 1)


;;; custom-set-variables
(custom-set-variables
  '(custom-enabled-themes '(tangotango))
  '(custom-safe-themes '("5d9351cd410bff7119978f8e69e4315fd1339aa7b3af6d398c5ca6fac7fd53c7" default))
  '(desktop-restore-frames nil)
  '(session-use-package t nil (session))
  ;; set time interval of echo area
  '(suggest-key-bindings 3)
  '(diff-command "diff")
  '(diff-switches "-Nau1")

  '(sql-product 'postgres)
  '(sql-postgres-login-params
	 '((user :default "postgres")
	   (database :default "dbg3")
	   (server :default "localhost")))
  '(sql-postgres-options '("-P" "pager=off"))
  ;; set shell used by multi-term
  '(multi-term-program "/bin/zsh")
  ;; ess pdflatex
  '(ess-swv-pdflatex-commands '("xelatex"))
  )

(setq-default indent-tabs-mode t)

(setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-x 5" "C-c" "C-c ;" "C-c ; f" "C-c ' f" "C-x n" "C-x"))
(setq guide-key/idle-delay 2)


;;; modify details of theme
(custom-set-faces
  '(org-link ((t (:underline t))))
)


;;; org-mode settings
(setq org-startup-indented t)
(setq org-capture-templates
	  '(("t" "Todo" entry (file+headline "~/org/gtd.org" "Tasks")
		 "* TODO %?\n  %i\n  %a")
		("j" "Journal" entry (file+datetree "~/org/journal.org")
		 "* %?\nEntered on %U\n  %i\n  %a")
		("l" "Link" plain (file (concat org-directory "/links.org"))
		 "- %?\n %x\n")))
;; active Babel languages
(org-babel-do-load-languages
   'org-babel-load-languages
    '((sql . t)))

;;; bind key dwim
(defun qiang-comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command. If no region is selected and current line is not blank and we are not at the end of the line, then comment current line. Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
	(comment-or-uncomment-region (line-beginning-position) (line-end-position))
	(comment-dwim arg)))
(global-set-key "\M-;" 'qiang-comment-dwim-line)


;;; bind key recentf-ido-find-file
(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
	(when file
	  (find-file file))))
;(recentf-mode 1) ; keep a list of recently opened files
;; set F7 to list recently opened file
(global-set-key (kbd "<f7>") 'recentf-ido-find-file)

(defun kill-buffer-and-window-other ()
  "kill the other buffer and its windows"
  (interactive)
  (progn (switch-window)
	 (kill-buffer-and-window)))
;; set C-x 4 1 to kill-buffer-and-window-other
(global-set-key (kbd "C-x 4 1") 'kill-buffer-and-window-other)


(defun sudo-shell-command (command)
  "shell-command with sudo"
  (interactive "MShell command (root): ")
  (with-temp-buffer
    (cd "/sudo::/")
    (async-shell-command command)))

(defun sudo-save ()
  (interactive)
  (if (not buffer-file-name)
      (write-file (concat "/sudo:root@localhost:" (ido-read-file-name "File:")))
    (write-file (concat "/sudo:root@localhost:" buffer-file-name))))

(provide 'init-local)
;;; init-local.el ends here
