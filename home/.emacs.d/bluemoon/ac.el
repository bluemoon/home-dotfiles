
;;; Some auto-complete sauce
;(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;;; Some fixes for AC
(setq ac-auto-start t)
(setq ac-quick-help-delay 0.5)
(ac-config-default)
