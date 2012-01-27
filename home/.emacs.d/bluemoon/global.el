;;; Generic emacs settings I cannot live without

;; Use command as the meta key

(setq ns-function-modifier (quote control))

;; Don't show the startup screen
(setq inhibit-startup-message t)

;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; Highlight regions and add special behaviors to regions.
;; "C-h d transient" for more info
;(setq transient-mark-mode t)

;; Display line and column numbers
(setq line-number-mode    t)
(setq column-number-mode  t)

;; Modeline info
(display-time-mode 1)
;; (display-battery-mode 1)

;; Small fringes
(set-fringe-mode '(1 . 1))

;; Emacs gurus don't need no stinking scroll bars
(when (fboundp 'toggle-scroll-bar)
  (toggle-scroll-bar -1))

;; Explicitly show the end of a buffer
(set-default 'indicate-empty-lines t)

;; Line-wrapping
(set-default 'fill-column 80)

;; Prevent the annoying beep on errors
;(setq visible-bell t)

;; Make sure all backup files only live in one place
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;; Gotta see matching parens
(show-paren-mode t)

;; Truncate lines
(setq truncate-lines t)
;(setq truncate-partial-width-windows nil)

;; For emacsclient
;(server-start)

;; Trailing whitespace is unnecessary
;(add-hook 'before-save-hook (lambda () (whitespace-cleanup)))

;; Trash can support
(setq delete-by-moving-to-trash t)

;; `brew install aspell --lang=en` (instead of ispell)
;(setq-default ispell-program-name "aspell")
;(setq ispell-list-command "list")
;(setq ispell-extra-args '("--sug-mode=ultra"))


;; show line numbers on the side
;(global-linum-mode 1)
;;; Get rid of most of the gui
;(tool-bar-mode -1)
;;;(menu-bar-mode -1)
(toggle-scroll-bar -1)


;;; Show me a line number and column number
(line-number-mode 1)
(column-number-mode 1)
;; zap-up-to-char, forward-to-word, backward-to-word, etc
(defun set-newline-and-indent ()
      (local-set-key (kbd "RET") 'newline-and-indent))

(add-hook 'python-mode-hook 'set-newline-and-indent)
(define-key global-map (kbd "RET") 'newline-and-indent)
