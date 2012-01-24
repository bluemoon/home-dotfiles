; -*- mode: lisp; tab-width: 4 -*-
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/vendor")

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(load "bluemoon/env")
(load "bluemoon/global")
(load "bluemoon/defuns")

(vendor 'color-theme)
(vendor 'color-theme-tomorrow)
(vendor 'auto-complete)
(vendor 'auto-complete-config)

(load "bluemoon/theme")
(load "bluemoon/bindings")
(load "bluemoon/tabs")
(load "bluemoon/flymake")
(load "bluemoon/disabled")
(load "bluemoon/fonts")
(load "bluemoon/utf-8")
(load "bluemoon/scratch")
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
(load "bluemoon/javascript")
(load "bluemoon/ri-emacs")
(load "bluemoon/mac")
(load "bluemoon/server-mode")
(load "bluemoon/shell-mode")

(vendor 'flymake)
(vendor 'autopair)
(vendor 'yasnippet)
(load "bluemoon/yasnippet")
(load "bluemoon/autopair")

;(vendor 'python-pep8)
;(vendor 'python-pylint)
;(vendor 'ruby-mode)
;(vendor 'rinari)
(vendor 'textmate)
(vendor 'maxframe      'mf 'maximize-frame)
(vendor 'filladapt)
(vendor 'coffee-mode)
(vendor 'haml-mode)
(vendor 'sass-mode)
(vendor 'htmlize)
(vendor 'full-ack      'ack 'ack-same 'ack-find-same-file 'ack-find-file 'ack-interactive)
(vendor 'cdargs        'cv 'cdargs)
(vendor 'magit         'magit-status)
(vendor 'psvn          'svn-status)
(vendor 'js2-mode      'js2-mode)
(vendor 'markdown-mode 'markdown-mode)
(vendor 'textile-mode  'textile-mode)
(vendor 'csv-mode      'csv-mode)
(vendor 'yaml-mode     'yaml-mode)
(vendor 'inf-ruby      'inf-ruby)
(vendor 'rcodetools    'xmp)
(vendor 'yasnippet)
(vendor 'jekyll)
(vendor 'lua-mode      'lua-mode)
(vendor 'feature-mode)
(vendor 'mode-line-bell)
(vendor 'revbufs       'revbufs)
(vendor 'shell-pop)
(vendor 'mo-git-blame  'mo-git-blame-file 'mo-git-blame-current)
(vendor 'ace-jump-mode 'ace-jump-mode 'ace-jump-word-mode 'ace-jump-char-mode 'ace-jump-line-mode)
(vendor 'key-chord)
