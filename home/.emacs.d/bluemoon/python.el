
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
;; Stops from erroring if there's a syntax err
(setq ropemacs-codeassist-maxfixes 3)

(setq ropemacs-guess-project t)
(setq ropemacs-enable-autoimport t)
(setq ropemacs-autoimport-modules '("flask.*" "trekseat"))
(defun epy-setup-ipython ()
  "Setup ipython integration with python-mode"
  (interactive)
  (setq
   python-shell-interpreter "ipython"
   python-shell-interpreter-args ""
   python-shell-prompt-regexp "In \[[0-9]+\]: "
   python-shell-prompt-output-regexp "Out\[[0-9]+\]: "
   python-shell-completion-setup-code ""
   python-shell-completion-string-code "';'.join(__IP.complete('''%s'''))\n")
  )
