
;;; Some auto-complete sauce
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(setq ac-dwim t)
(ac-config-default)
(global-auto-complete-mode t)
(auto-complete-mode t)


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
