;;; localcodes --- local codes
;;; Commentary:
;;; Code:

;;; load packages
(require 'init-setupterm)
(require-package 'cal-china-x)
(require 'cal-china-x)
(setq mark-holidays-in-calendar t
	  cal-china-x-important-holidays cal-china-x-chinese-holidays
	  calendar-holidays cal-china-x-important-holidays)
;;; emacs speaks statistics
(require-package 'ess)
(require-package 'ess-R-data-view)
(require-package 'ess-R-object-popup)
(require-package 'ess-smart-underscore)
(require 'ess-site)

;; sdcv is dependent on showtip
(require-package 'showtip)
(require 'sdcv)

(require 'xmsi-math-symbols-input)


;; (autoload 'sawfish-mode "sawfish" "sawfish-mode" t)
;; (setq auto-mode-alist (cons '("\\.sawfishrc$"  . sawfish-mode) auto-mode-alist)
;;       auto-mode-alist (cons '("\\.jl$"         . sawfish-mode) auto-mode-alist)
;;       auto-mode-alist (cons '("\\.sawfish/rc$" . sawfish-mode) auto-mode-alist))

(setq display-time-format "%Y-%m-%d %H:%M")

(setq sdcv-dictionary-simple-list        ;; a simple dictionary list
      '(
		"新世纪英汉科技大词典"
		"朗道英汉字典5.0"
		"懒虫简明英汉词典"
		"DrEye4in1词典"
        ))
;; (setq sdcv-dictionary-complete-list      ;; a complete dictionary list
;;       '(
;; 		"朗道英汉字典5.0"
;; 		"牛津英汉双解美化版"
;; 		"Longman Dictionary of Contemporary English (4th Ed)"
;; 		"新世纪英汉科技大词典"
;; 		"懒虫简明英汉词典"
;; 		"DrEye4in1词典"
;; 		"汉语大词典 离线版"
;; 		"中文维基百科"
;;         ))
(global-set-key (kbd "C-c d") 'sdcv-search-pointer+)

(display-time-mode 1)

;; Fill Column Indicator (fci-mode)
;; (require 'fill-column-indicator)
(setq fci-rule-column 80)
;; (setq fci-rule-width 1)
(setq fci-rule-color "darkblue")
;; (setq fci-rule-use-dashes t)
;; fci-dash-pattern: 0 ~ 1
;; (setq fci-dash-pattern .40)
;; (add-hook 'after-change-major-mode-hook 'fci-mode)
(add-hook 'python-mode-hook 'fci-mode)

;; Dired reuse directory buffer
;; (toggle-diredp-find-file-reuse-dir 1)

(require-package 'electric-spacing)
;; (electric-spacing-mode 1)
(add-hook 'python-mode-hook 'electric-spacing-mode)
;; (add-hook 'org-mode-hook 'electric-spacing-mode)

(require-package 'elpy)
(require-package 'pyvenv)
(require-package 'highlight-indentation)
(elpy-enable)

;;(autoload 'pylint "pylint")
;;(add-hook 'python-mode-hook 'pylint-add-menu-items)
;;(add-hook 'python-mode-hook 'pylint-add-key-bindings)

(require-package 'adoc-mode)
(require-package 'company)
(require-package 'tangotango-theme)

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
 '(ess-keep-dump-files nil)
 ;; sdcv timeout
 '(showtip-timeout 60)
 )

;;; (setq-default indent-tabs-mode t)

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
