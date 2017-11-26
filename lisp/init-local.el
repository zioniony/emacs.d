;;; localcodes --- local codes
;;; Commentary:
;;; Code:
;; set path:
;; example of setting env var named “path”, by appending a new path to existing path

(setenv "PATH" (concat "~/miniconda3/bin" ":" (getenv "PATH")))
;; `pip install --user <pkg>` install programs into '~/.local/bin',
;; which is not perceived by emacs.
;;(setenv "PATH" (concat "~/.local/bin:~/bin:" (getenv "PATH")))
(setenv "PYTHONPATH" "/home/ly/work")
;;(setq exec-path (append '("~/.local/bin" "~/bin") exec-path))

(global-set-key "\M-]" 'comint-dynamic-complete-filename)
(global-set-key (kbd "C-c b") 'org-iswitchb)
;;; click Shift + Mid-Mouse to open url
(global-set-key [S-mouse-2] 'browse-url-at-mouse)
(after-load 'python (define-key python-mode-map (kbd "C-c r") 'python-shell-send-region))
(after-load 'python (define-key python-mode-map (kbd "C-c s") 'python-shell-send-defun))
(after-load 'python (define-key python-mode-map (kbd "C-c h") (lambda () (interactive) (message (python-info-current-defun)))))
;; (define-key python-mode-map (kbd "C-c f") 'python-shell-send-defun)
(after-load 'elpy (define-key python-mode-map (kbd "C-c g") 'elpy-goto-definition-other-window))
;;(global-set-key "\C-\\" nil)

;;; load packages
(require 'init-setupterm)
(require 'init-macros)
(require-package 'cal-china-x)
(require 'cal-china-x)
(setq mark-holidays-in-calendar t
	  cal-china-x-important-holidays cal-china-x-chinese-holidays
	  calendar-holidays cal-china-x-important-holidays)

;;; AUCTEX
(require-package 'auctex)
(require-package 'auto-complete-auctex)

;;; emacs speaks statistics
(require-package 'ess)
(require-package 'ess-R-data-view)
;;(require-package 'ess-R-object-popup)
(require-package 'ess-smart-underscore)
(require 'ess-site)

;;; org-mode taskjuggler
(require 'ox-taskjuggler)

;;; realgud
(require-package 'realgud)
(require 'realgud)

;; sdcv is dependent on showtip
(require-package 'showtip)
(require 'sdcv)

;; python sphinx doc auto generator
(require-package 'sphinx-doc)
(require 'sphinx-doc)

(require 'xmsi-math-symbols-input)


;; (autoload 'sawfish-mode "sawfish" "sawfish-mode" t)
;; (setq auto-mode-alist (cons '("\\.sawfishrc$"  . sawfish-mode) auto-mode-alist)
;;       auto-mode-alist (cons '("\\.jl$"         . sawfish-mode) auto-mode-alist)
;;       auto-mode-alist (cons '("\\.sawfish/rc$" . sawfish-mode) auto-mode-alist))

(setq w3m-default-display-inline-images t)

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "chromium")
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
(global-set-key (kbd "C-x t") 'sdcv-search-pointer+)

;; (global-hl-line-mode 1)
;; (set-face-background 'hl-line "#333333")

(display-time-mode 1)

;;; make tab-complete work in yas feild
(setq yas/triggers-in-field t);

;; Fill Column Indicator (fci-mode)
;; (require 'fill-column-indicator)
(require-package 'fill-column-indicator)
(setq fci-rule-column 80)
;; (setq fci-rule-width 1)
(setq fci-rule-color "darkblue")
;; (setq fci-rule-use-dashes t)
;; fci-dash-pattern: 0 ~ 1
;; (setq fci-dash-pattern .40)
;; (add-hook 'after-change-major-mode-hook 'fci-mode)
(add-hook 'python-mode-hook 'fci-mode)
(add-hook 'python-mode-hook 'subword-mode)
(add-hook 'org-mode-hook 'fci-mode)
(add-hook 'org-mode-hook 'yas-minor-mode)

;; Dired reuse directory buffer
;; (toggle-diredp-find-file-reuse-dir 1)

(require-package 'electric-spacing)
;; (electric-spacing-mode 1)
(add-hook 'python-mode-hook 'electric-spacing-mode)
;; (add-hook 'org-mode-hook 'electric-spacing-mode)

(require-package 'elpy)
;; (require-package 'pyvenv)
;; (add-hook 'python-mode-hook (pyvenv-workon "py3"))
(require-package 'highlight-indentation)
;; (pyvenv-workon "py3.4")
(elpy-enable)
(elpy-use-ipython)
;; (pyvenv-workon "currentpy")
;; (pyvenv-activate (expand-file-name "~/miniconda3/envs/cubesviewer"))
;; (setq python-shell-interpreter "ipython3" python-shell-interpreter-args "--simple-prompt --pprint")
;; (autoload 'pylint "pylint")
;; (add-hook 'python-mode-hook 'pylint-add-menu-items)
;; (add-hook 'python-mode-hook 'pylint-add-key-bindings)

;; (require-package 'go-mode)
;; (require 'go-mode-load)
;; (require-package 'go-eldoc)
;; (require-package 'company-go)
;; (require-package 'go-snippets)
;; (add-hook 'go-mode-hook 'go-eldoc-setup)
;; (add-hook 'go-mode-hook (lambda ()
;;                           (set (make-local-variable 'company-backends) '(company-go))
;;                           (company-mode)))
(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-idle-delay 3)                         ; decrease delay before autocompletion popup shows
(setq company-echo-delay 0)                          ; remove annoying blinking
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
;; (add-hook 'before-save-hook 'gofmt-before-save)

(defvar py-init-lines
  '(
    "#!/usr/bin/env python"
    "# -*- coding: utf-8 -*-"
    "from __future__ import division, absolute_import"
    "from __future__ import print_function, unicode_literals"
    )
  "Init lines to add to empty python files."
  )

(add-hook 'after-change-major-mode-hook
          '(lambda ()
             (code-initlines py-init-lines 'python-mode)
             )
          )

(require-package 'adoc-mode)
(require-package 'company)
(require-package 'tangotango-theme)

;;; custom-set-variables
(custom-set-variables
 '(custom-enabled-themes (quote (tangotango)))
 '(custom-safe-themes
   (quote
    ("49e5a7955b853f70d1fe751b2f896921398b273aa62f47bda961a45f80219581" default)))
 '(desktop-restore-frames nil)
 '(session-use-package t nil (session))
 ;; set time interval of echo area
 '(suggest-key-bindings 3)
 '(diff-command "diff")
 '(diff-switches "-Nau1")
 ;; tab width
 '(tab-width 4)
 ;; '(sql-product 'postgres)
 ;; '(sql-postgres-login-params
 ;;   '((user :default "postgres")
 ;;     (database :default "dbg3")
 ;;     (server :default "localhost")))
 '(sql-postgres-options '("-P" "pager=off"))

 ;; set shell used by multi-term
 '(multi-term-program "/bin/zsh")
 '(org-taskjuggler-process-command "tj3 --no-color --output-dir %o %f")
 '(org-taskjuggler-reports-directory "output")
 '(org-confirm-babel-evaluate nil)
 ;; python
 ;; simple-prompt: see https://github.com/jorgenschaefer/elpy/issues/949
 '(python-shell-interpreter-args "-i --simple-prompt --pprint")
 '(python-shell-interpreter-interactive-arg "-i")
 ;; '(python-shell-interpreter-args "-i --gui=qt4")
 ;; '(python-shell-interpreter-interactive-arg "-i --gui=qt4")
 ;; ess latex
 '(TeX-engine (quote xetex))
 '(ess-swv-pdflatex-commands '("xelatex"))
 '(gud-pdb-command-name "python -m pdb")
 '(realgud:pdb-command-name "python -m pdb")
 '(ess-keep-dump-files nil)
 '(ess-ask-for-ess-directory nil)
 '(ess-swv-processor (quote knitr))
 ;; sdcv timeout
 '(showtip-timeout 60)
 )


;;; from https://github.com/tmtxt/.emacs.d/blob/master/config/tmtxt-sql.el
;;; guide https://truongtx.me/2014/08/23/setup-emacs-as-an-sql-database-client/
(setq sql-mysql-options '("--auto-rehash"))
(setq sql-connection-alist
      '((report (sql-product 'postgres)
                (sql-port 5432)
                (sql-server "123.1.187.106")
                (sql-user "xyt_dm")
                (sql-database "postgres"))
        (crawl (sql-product 'postgres)
               (sql-port 5432)
               (sql-server "58.64.197.105")
               (sql-user "xyt_dm")
               (sql-database "xytinc"))
        (ebaytools3 (sql-product 'mysql)
                    (sql-port 3306)
                    (sql-server "erp.v2.xytinc.com")
                    (sql-user "XYT_Report")
                    (sql-database "ebaytools3"))
        (xytdmebt3 (sql-product 'mysql)
                   (sql-port 3306)
                   (sql-server "erp.v2.xytinc.com")
                   (sql-user "xyt_dm_ro")
                   (sql-database "ebaytools3"))
        (pglocal (sql-product 'postgres)
                 (sql-port 5432)
                 (sql-server "localhost")
                 (sql-user "postgres")
                 (sql-database "xytinc"))))

(add-hook 'sql-interactive-mode-hook
          (lambda ()
            (toggle-truncate-lines t)))
(defun my-sql-connect (product connection)
  ;; load the password
  (require 'init-sqlpasswd "init-sqlpasswd.el.gpg")

  ;; update the password to the sql-connection-alist
  (let ((connection-info (assoc connection sql-connection-alist))
        (sql-password (car (last (assoc connection my-sql-password)))))
    (delete sql-password connection-info)
    (nconc connection-info `((sql-password ,sql-password)))
    (setq sql-connection-alist (assq-delete-all connection sql-connection-alist))
    (add-to-list 'sql-connection-alist connection-info))

  ;; connect to database
  (setq sql-product product)
  (sql-connect connection))


(defun ly/sql-connect-server (connection)
  "Connect to the input server using tmtxt/sql-servers-list"
  (interactive
   (helm-comp-read "Select server: " (mapcar (lambda (item)
                                               (list
                                                (symbol-name (nth 0 item))
                                                (nth 0 item)))
                                             sql-connection-alist)))
  ;; password
  (require 'init-sqlpasswd "init-sqlpasswd.el.gpg")
  ;; get the sql connection info and product from the sql-connection-alist
  (let* ((connection-info (assoc connection sql-connection-alist))
         (connection-product (nth 1 (nth 1 (assoc 'sql-product connection-info))))
         (sql-password (nth 1 (assoc connection my-sql-password))))
    ;; delete the connection info from the sql-connection-alist
    (setq sql-connection-alist (assq-delete-all connection sql-connection-alist))
    ;; delete the old password from the connection-info
    (setq connection-info (assq-delete-all 'sql-password connection-info))
    ;; add the password to the connection-info
    (nconc connection-info `((sql-password ,sql-password)))
    ;; add back the connection info to the beginning of sql-connection-alist
    ;; (last used server will appear first for the next prompt)
    (add-to-list 'sql-connection-alist connection-info)
    ;; override the sql-product by the product of this connection
    (setq sql-product connection-product)
    ;; connect
    (if current-prefix-arg
        (sql-connect connection connection)
      (sql-connect connection))))

;;; sql up mode
;; (tmtxt/set-up 'sqlup-mode
;;   (add-hook 'sql-mode-hook 'sqlup-mode)
;;   (add-hook 'sql-interactive-mode-hook 'sqlup-mode))



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
;;; http://doc.norang.ca/org-mode.html#OrgBabel
;;; (setq org-ditaa-jar-path "/usr/share/java/ditaa/ditaa-0_9.jar")
(setq org-plantuml-jar-path "/opt/plantuml/plantuml.jar")

(add-hook 'org-babel-after-execute-hook 'bh/display-inline-images 'append)

;; Make babel results blocks lowercase
(setq org-babel-results-keyword "results")

(defun bh/display-inline-images ()
  (condition-case nil
      (org-display-inline-images)
    (error nil)))

(org-babel-do-load-languages
 (quote org-babel-load-languages)
 (quote ((emacs-lisp . t)
         (dot . t)
         (ditaa . t)
         (R . t)
         (python . t)
         (sql . t)
         (ruby . t)
         (gnuplot . t)
         (clojure . t)
         (sh . t)
         (ledger . t)
         (org . t)
         (plantuml . t)
         (latex . t))))

;; Do not prompt to confirm evaluation
;; This may be dangerous - make sure you understand the consequences
;; of setting this -- see the docstring for details
(setq org-confirm-babel-evaluate nil)

;; Use fundamental mode when editing plantuml blocks with C-c '
(add-to-list 'org-src-lang-modes (quote ("plantuml" . fundamental)))
;; Don't enable this because it breaks access to emacs from my Android phone
(setq org-startup-with-inline-images nil)



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

;;(recentf-mode 1) ; keep a list of recently opened files
;; set F7 to list recently opened file
;;(global-set-key (kbd "<f7>") 'recentf-ido-find-file)

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

(defun display-ansi-colors ()
  (interactive)
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region (point-min) (point-max))))

(defun ly/proxy ()
  "set/unset proxy"
  (interactive)
  (setq proxytype (read-from-minibuffer "(s)ocks/(h)ttp/(n)il? "))
  (setq url-gateway-method 'native)
  (setq url-proxy-services nil)
  (message "unset proxy!")
  (if (string= proxytype "s")
      (progn
        (setq socks-noproxy '("127.0.0.1"))
        (setq socks-server '("Default server" "127.0.0.1" 8081 5))
        (setq url-gateway-method 'socks)
        (message "set proxy to sock5!"))
    (when (string= proxytype "h")
      (setq url-proxy-services
            '(("no_proxy" . "^\\(localhost\\|192.168.1.*\\)")
              ("http" . "127.0.0.1:8080")
              ("https" . "127.0.0.1:8080")))
      (message "set proxy to http!"))))


(defun ly/unittest (&optional pattern)
  "Make unittest comfortable."
  (interactive "sWhat do you want to test?")
  (let ((delimeter (if (string= pattern "") nil ".")) )
    (shell-command (concat "python -m unittest "
                           (file-name-sans-extension
                            (file-name-nondirectory buffer-file-name))
                           delimeter
                           pattern)))
  )

;; http://emacs.stackexchange.com/questions/2206/i-want-to-have-the-kbd-tags-for-my-blog-written-in-org-mode/2208#2208
(defun ly/insert-key (key)
  "Ask for a KEY then insert its description.
Will work on both `org-mode' and any mode that accepts plain html."
  (interactive "kType key sequence: ")
  (let* ((is-org-mode (derived-mode-p 'org-mode))
         (tag (if is-org-mode
                  "@@html:<kbd>%s</kbd>@@"
                "<kbd>%s</kbd>")))
    (if (null (equal key "\r"))
        (insert
         (format tag (help-key-description key nil)))
      (insert (format tag ""))
      (forward-char (if is-org-mode -8 -6)))))
(define-key org-mode-map "\C-ck" #'endless/insert-key)

(define-skeleton org-skeleton
  "Header info for a emacs-org file."
  "Title: "
  "#+TITLE:" str " \n"
  "#+AUTHOR: Your Name\n"
  "#+email: your-email@server.com\n"
  "#+INFOJS_OPT: \n"
  "#+BABEL: :session *R* :cache yes :results output graphics :exports both :tangle yes \n"
  "-----"
  )
(global-set-key [C-S-f4] 'org-skeleton)

(defun shift-text (distance)
  (if (use-region-p)
      (let ((mark (mark)))
        (save-excursion
          (indent-rigidly (region-beginning)
                          (region-end)
                          distance)
          (push-mark mark t t)
          (setq deactivate-mark nil)))
    (indent-rigidly (line-beginning-position)
                    (line-end-position)
                    distance)))

(defun shift-right (count)
  (interactive "p")
  (shift-text count))

(defun shift-left (count)
  (interactive "p")
  (shift-text (- count)))

(defun shift-right-tab ()
  (interactive)
  (shift-text 4))

(defun shift-left-tab ()
  (interactive)
  (shift-text (- 4)))
(global-set-key (kbd "<M-left>") 'shift-left-tab)
(global-set-key (kbd "<M-right>") 'shift-right-tab)


(defun python-args-to-google-docstring (text &optional make-fields)
  "Return a reST docstring format for the python arguments in yas-text."
  (let* ((indent (concat "\n" (make-string (current-column) 32)))
         (args (python-split-args text))
         (nr 0)
         (formatted-args
          (mapconcat
           (lambda (x)
             (concat "   " (nth 0 x)
                     (if make-fields (format " ${%d:arg%d}" (incf nr) nr))
                     (if (nth 1 x) (concat " \(default " (nth 1 x) "\)"))))
           args
           indent)))
    (unless (string= formatted-args "")
      (concat
       (mapconcat 'identity
                  (list "" "Args:" formatted-args)
                  indent)
       "\n"))))

(defun code-initlines (lines mode)
  "Add initial LINES to specific MODE."
  (when (and (equal major-mode mode) (equal 0 (buffer-size)))
    (loop for line in lines
          do (progn
               (insert line)
               (newline))
          )
    ))

;;; https://stackoverflow.com/questions/1731634/dont-show-uninteresting-files-in-emacs-completion-window
;; (add-to-list 'ido-ignore-files "\.pyc")
(defadvice completion--file-name-table (after
                                        ignoring-backups-f-n-completion
                                        activate)
  "Filter out results when they match `completion-ignored-extensions'."
  (let ((res ad-return-value))
    (if (and (listp res)
             (stringp (car res))
             (cdr res))                 ; length > 1, don't ignore sole match
        (setq ad-return-value
              (completion-pcm--filename-try-filter res)))))

(eval-after-load "dired"
  '(require 'dired-x))

(add-hook 'dired-mode-hook
          (lambda ()
            (dired-omit-mode 1)))

(require 'init-custom nil t)

(provide 'init-local)
;;; init-local.el ends here
