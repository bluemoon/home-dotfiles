; -*- mode: lisp; tab-width: 4 -*-
(setq emacs-d (concat (expand-file-name "~/.emacs.d") "/"))
(setq vendor (concat emacs-d "/vendor/"))
(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file) (load custom-file))

(setq load-path (append (list emacs-d
                              vendor
                              (concat emacs-d "color-theme")
                              (concat emacs-d "magit")
                              (concat vendor "yasnippet")
                              (concat vendor "gist.el")
                              (concat vendor "textmate.el")
                              (concat vendor "tabbar"))
                        load-path))


(require 'less-css-mode)
;;; Smart tabs
(require 'smarttabs)
;;; Magit
(require 'magit)
(global-set-key (kbd "C-c C-G") 'magit-status)
(global-set-key (kbd "M-<f1>") 'magit-status)
;;; Pretty python lambda's
(require 'lambda-mode)
(add-hook 'python-mode-hook #'lambda-mode 1)
(setq lambda-symbol (string (make-char 'greek-iso8859-7 107)))
;;; Python modes
(require 'python-pep8)
(require 'python-pylint)
(require 'flymake)
(setq flymake-log-level 3)
(require 'fill-column-indicator)
;;; Add ido for backspace awesomeness
(require 'ido)
(ido-mode t)
;;; Some auto-complete sauce
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;;; Some fixes for AC
(setq ac-auto-start t)
(setq ac-quick-help-delay 0.5)
(ac-config-default)
;;; Yasnippet
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/vendor/yasnippet/snippets")

(require 'gist)
(require 'textmate)
(textmate-mode)


;;; Backwords kill
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
;; Try that
(setq ns-function-modifier (quote control))
;; Make files happy
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
;(require 'pymacs)
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)

(ac-ropemacs-initialize)
(add-hook 'python-mode-hook
      (lambda ()
    (add-to-list 'ac-sources 'ac-source-ropemacs)))

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
;; Copy by linking
(setq backup-by-copying-when-linked t)



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
 '(show-paren-mode t)
 '(vc-follow-symlinks t))


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.

(when
    (load
     (expand-file-name "~/.emacs.d/package.el"))
  (package-initialize))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
