; -*- mode: lisp; tab-width: 4 -*-
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/coffee-mode")
(add-to-list 'load-path "~/.emacs.d/jade-mode")
(add-to-list 'load-path "~/.emacs.d/color-theme")
(add-to-list 'load-path "~/.emacs.d/vendor/coffee-mode")
(add-to-list 'load-path "~/.emacs.d/vendor/yasnippet")

(setq load-path (cons "~/.emacs.d/org-mode/lisp" load-path))
(setq load-path (cons "~/.emacs.d/org-mode/contrib/lisp" load-path))


(load "~/.emacs.d/nxhtml/autostart.el")




(require 'jinja)

;;; Magit
(require 'magit)
(global-set-key (kbd "C-c C-G") 'magit-status)
(global-set-key (kbd "M-<f1>") 'magit-status)



;;; Backwords kill
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)


;;; Org-mode
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(transient-mark-mode 1)
(add-hook 'message-mode-hook 'turn-on-flyspell 'append)
(setq org-log-done t)
(add-hook 'org-mode-hook (lambda ()
                           (local-set-key "\M-n" 'outline-next-visible-heading)
                           (local-set-key "\M-p" 'outline-previous-visible-heading)
                           ;; table
                           (local-set-key "\M-\C-w" 'org-table-copy-region)
                           (local-set-key "\M-\C-y" 'org-table-paste-rectangle)
                           (local-set-key "\M-\C-l" 'org-table-sort-lines)
                           ;; display images
                           (local-set-key "\M-I" 'org-toggle-iimage-in-org)
                           ;; fix tab
                           (local-set-key "\C-y" 'yank)
                           (local-set-key "RET" 'org-meta-return)
                           (local-set-key "<left>" 'org-metaleft)
                           (local-set-key "<right>" 'org-metaright)
                           ;; yasnippet (allow yasnippet to do it's thing in org files)
                           (org-set-local 'yas/trigger-key [tab])

                           (define-key yas/keymap [tab] 'yas/next-field-group)))



(require 'less-css-mode)


;;; Smart tabs
(require 'smarttabs)
;;; Coffeescript
(defun coffee-custom ()
  "coffee-mode-hook"

  ;; Emacs key binding
  (define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer))

(add-hook 'coffee-mode-hook '(lambda () (coffee-custom)))
;;; Pretty python lambda's
(require 'lambda-mode)
(add-hook 'python-mode-hook #'lambda-mode 1)
(setq lambda-symbol (string (make-char 'greek-iso8859-7 107)))

;;; Python modes
(require 'python-pep8)
(require 'python-pylint)
;;;(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;; GAS Mode
(require 'gas-mode)

;;; Coffee script
(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))
(defun coffee-custom ()
  "coffee-mode-hook"
 (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))

(define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer)

(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'load-path "~/.emacs.d/fuzzy-find-in-project/")
(require 'fuzzy-find-in-project)
(fuzzy-find-project-root "~/Project/pypy")





(require 'flymake)
(setq flymake-log-level 3)

(require 'sws-mode)
(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . sws-mode))
(require 'fill-column-indicator)
;;; Add ido for backspace awesomeness
(require 'ido)




;;; Some auto-complete sauce
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;;; Add AC-Clang
(require 'auto-complete-clang)
;;(require 'auto-complete-python)

;;; Some fixes for AC
(setq ac-auto-start t)
(setq ac-quick-help-delay 0.5)
(ac-config-default)

(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(require 'pymacs)
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)

(ac-ropemacs-initialize)
(add-hook 'python-mode-hook
      (lambda ()
    (add-to-list 'ac-sources 'ac-source-ropemacs)))


(add-to-list 'load-path
             "~/.emacs.d/vendor/yasnippet")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/vendor/yasnippet/snippets")

;;; More reasonable backup files
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;; show line numbers on the side
(global-linum-mode 1)
;;; Get rid of most of the gui
(tool-bar-mode -1)
;;;(menu-bar-mode -1)
(toggle-scroll-bar -1)

;;; Show my parenthese
(show-paren-mode t)
;;; Show me a line number and column number
(line-number-mode 1)
(column-number-mode 1)

;;; Be reasonable with tabs
(setq tab-width 4)
(set-variable 'indent-tabs-mode nil)
(setq inhibit-startup-message t)

(require 'color-theme)
(require 'color-theme-tomorrow)
(color-theme-initialize)
(color-theme-tomorrow-night-bright)
;;; This is for GNU Emacs 22
(defun terminal-init-screen ()
  "Terminal initialization function for screen."
  ;; Use the xterm color initialization code.
  (load "term/xterm")
  (xterm-register-default-colors)
  (tty-set-up-initial-frame-faces))

    ;;; This is for GNU Emacs 21
  (if (= 21 emacs-major-version)
    (load "term/xterm-256color"))


;; Many custom set variables
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(ecb-tree-indent 3)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(show-paren-mode t))
