; -*- mode: lisp; tab-width: 4 -*-
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/vendor")

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(vendor 'color-theme)
(vendor 'color-theme-tomorrow)
(vendor 'auto-complete)
(vendor 'auto-complete-config)
(vendor 'flymake)
(vendor 'yasnippet)
(vendor 'autopair)

(load "bluemoon/env")
(load "bluemoon/global")
(load "bluemoon/defuns")
(load "bluemoon/theme")
(load "bluemoon/bindings")
(load "bluemoon/tabs")
;(load "bluemoon/flymake")
(load "bluemoon/disabled")
(load "bluemoon/fonts")
(load "bluemoon/utf-8")
(load "bluemoon/grep")
(load "bluemoon/ac")
(load "bluemoon/python")
(load "bluemoon/diff")
(load "bluemoon/ido")
(load "bluemoon/dired")
(load "bluemoon/rectangle")
(load "bluemoon/recentf")
(load "bluemoon/rectangle")
(load "bluemoon/org")
(load "bluemoon/zoom")
;(load "bluemoon/javascript")
(load "bluemoon/mac")
;(load "bluemoon/server-mode")
(load "bluemoon/shell-mode")
;(load "bluemoon/yasnippet")
(load "bluemoon/pair")
;(load "bluemoon/ri-emacs")

;(vendor 'python-pep8)
;(vendor 'python-pylint)
;(vendor 'ruby-mode)
;(vendor 'rinari)
(vendor 'textmate)
(vendor 'lambda-mode)
;(vendor 'maxframe      'mf 'maximize-frame)
;(vendor 'filladapt)
;(vendor 'coffee-mode)
;(vendor 'haml-mode)
;(vendor 'sass-mode)
;(vendor 'htmlize)
;(vendor 'full-ack      'ack 'ack-same 'ack-find-same-file 'ack-find-file 'ack-interactive)
;(vendor 'cdargs        'cv 'cdargs)
(vendor 'magit         'magit-status)
;(vendor 'psvn          'svn-status)
(vendor 'js2-mode      'js2-mode)
;(vendor 'markdown-mode 'markdown-mode)
;(vendor 'textile-mode  'textile-mode)
;(vendor 'csv-mode      'csv-mode)
;(vendor 'yaml-mode     'yaml-mode)
;(vendor 'inf-ruby      'inf-ruby)
;(vendor 'rcodetools    'xmp)
;(vendor 'yasnippet)
;(vendor 'jekyll)
;(vendor 'lua-mode      'lua-mode)
;(vendor 'feature-mode)
;(vendor 'mode-line-bell)
(vendor 'revbufs       'revbufs)
(vendor 'shell-pop)
;(vendor 'mo-git-blame  'mo-git-blame-file 'mo-git-blame-current)
(vendor 'ace-jump-mode 'ace-jump-mode 'ace-jump-word-mode 'ace-jump-char-mode 'ace-jump-line-mode)
(vendor 'key-chord)

(require 'python)
(require 'auto-complete)
(require 'auto-complete-config)
;;; Some auto-complete sauce
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;(setq ac-dwim t)
(ac-config-default)
;(global-auto-complete-mode t)
;(auto-complete-mode t)
(setq ac-dwim t)

(define-key ac-complete-mode-map "\t" 'ac-expand)
(define-key ac-complete-mode-map "\r" 'ac-complete)
(define-key ac-complete-mode-map "\M-n" 'ac-next)
(define-key ac-complete-mode-map "\M-p" 'ac-previous)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
(setq ac-auto-start 2)
(setq ac-delay 0.1)

(ac-ropemacs-initialize)

(defun ac-ropemacs-candidates ()
  (mapcar (lambda (completion)
      (concat ac-prefix completion))
    (rope-completions)))

(ac-define-source nropemacs
  '((candidates . ac-ropemacs-candidates)
    (symbol     . "p")))

(ac-define-source nropemacs-dot
  '((candidates . ac-ropemacs-candidates)
    (symbol     . "p")
    (prefix     . c-dot)
    (requires   . 0)))


(defvar ac-ropemacs-completions-cache nil)

(defvar ac-source-ropemacs
  '((init
     . (lambda ()
         (setq ac-ropemacs-completions-cache
               (mapcar
                (lambda (completion)
                  (concat ac-prefix completion))
                (ignore-errors
                  (rope-completions))))))
    (candidates . (lambda ()
                    (all-completions ac-prefix ac-ropemacs-completions-cache)))))

;; Disabling Yasnippet completion
(defun bm-snips-from-table (table)
  (with-no-warnings
    (let ((hashtab (ac-yasnippet-table-hash table))
          (parent (ac-yasnippet-table-parent table))
          candidates)
      (maphash (lambda (key value)
                 (push key candidates))
               hashtab)
      (identity candidates)
      )))

(defun bm-get-all-snips ()
  (require 'yasnippet) ;; FIXME: find a way to conditionally load it
  (let (candidates)
    (maphash
     (lambda (kk vv) (push (epy-snips-from-table vv) candidates)) yas/tables)
    (apply 'append candidates))
  )

(add-hook 'python-mode-hook
          (lambda ()
            (cond ((file-exists-p ".ropeproject")
                   (rope-open-project default-directory))
                  ((file-exists-p "../.ropeproject")
                   (rope-open-project (concat default-directory "..")))
                  )))

(defun ac-nropemacs-setup ()
  ;(setq ac-sources (append '(ac-source-nropemacs
  ;                           ac-source-nropemacs-dot) ac-sources)))
   (setq ac-sources (append '(ac-source-ropemacs))))
  ;                          ac-source-nropemacs-dot) ac-sources)))
;(defun ac-python-mode-setup ()
;  (add-to-list 'ac-sources 'ac-source-yasnippet))

(add-hook 'python-mode-hook 'ac-python-mode-setup)
;(add-hook 'rope-open-project-hook 'ac-nropemacs-setup)
