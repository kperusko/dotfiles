;; etags

(defface ac-etags-candidate-face
  '((t (:inherit ac-candidate-face :foreground "navy")))
  "Face for etags candidate"
  :group 'auto-complete)

(defface ac-etags-selection-face
  '((t (:inherit ac-selection-face :background "navy")))
  "Face for the etags selected candidate."
  :group 'auto-complete)

(defun ac-etags-candidate ()
  (ignore-errors
(if tags-table-list
(all-completions ac-prefix (tags-completion-table) nil))))

(ac-define-source etags
  '((candidates . ac-etags-candidate)
    (candidate-face . ac-etags-candidate-face)
    (selection-face . ac-etags-selection-face)
    (requires . 3)
    (symbol . "s")))

(defun ac-common-setup ()
  (setq ac-sources (append '(ac-source-yasnippet ac-source-gtags ac-source-etags) ac-sources)))

(ac-complete-etags)
