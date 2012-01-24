;;; Javscript is fun

;; Standard js-mode
(setq js-indent-level 2)

(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
