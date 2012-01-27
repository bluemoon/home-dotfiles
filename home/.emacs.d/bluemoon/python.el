
;;; Pretty python lambda's
;(require 'lambda-mode)
(add-hook 'python-mode-hook #'lambda-mode 1)
(setq lambda-symbol (string (make-char 'greek-iso8859-7 107)))
;;; Python modes
;(require 'python-pep8)
;(require 'python-pylint)

(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
;(require 'pymacs)
(pymacs-load "ropemacs" "rope-")
(ac-ropemacs-initialize)
(setq ropemacs-guess-project t)
(setq ropemacs-enable-autoimport t)
  (setq ropemacs-autoimport-modules '("flask.*" "trekseat"))
