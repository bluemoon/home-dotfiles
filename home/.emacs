; -*- mode: lisp; tab-width: 4 -*-
(add-to-list 'load-path "~/.emacs.d/")
(require 'fill-column-indicator)

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
 '(ecb-tree-indent 3)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(show-paren-mode t))
(if (display-graphic-p)
    (custom-set-faces
     ;; custom-set-faces was added by Custom.
     ;; If you edit it by hand, you could mess it up, so be careful.
     ;; Your init file should contain only one such instance.
     ;; If there is more than one, they won't work right.
     '(default ((t (:stipple nil :background "#272822" :foreground 
                             "#F8F8F2" :inverse-video nil :box nil :strike-through nil :overline nil 
                             :underline nil :slant normal :weight normal :height 110 :width normal ))))

     '(cursor ((t (:background "#F8F8F2" :foreground "#272822"))))
     '(font-lock-comment-face ((((class color) (min-colors 88) (background dark)) (:foreground "#75715E"))))
     '(font-lock-function-name-face ((((class color) (min-colors 88) (background dark)) (:foreground "#A6E22E" :bold nil))))
     '(font-lock-keyword-face ((((class color) (min-colors 88) (background dark)) (:foreground "#F92672" :bold nil))))
     '(font-lock-preprocessor-face ((t (:inherit font-lock-builtin-face :foreground "#66d9ef"))))
     '(font-lock-string-face ((((class color) (min-colors 88) (background dark)) (:foreground "#E6DB74"))))
     '(font-lock-type-face ((((class color) (min-colors 88) (background dark)) (:foreground "#66d9ef"))))
     '(font-lock-variable-name-face ((((class color) (min-colors 88) (background dark)) (:foreground "#FD971F"))))
     '(region ((((class color) (min-colors 88) (background dark)) (:background "#49483E"))))
     '(show-paren-match ((((class color) (background dark)) (:background "#3E3D32"))))))


