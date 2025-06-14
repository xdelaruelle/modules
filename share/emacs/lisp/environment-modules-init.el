;; Activate modulefile-mode

;; Use first line of file to recognize file type
(add-to-list 'magic-mode-alist '("#%Module" . modulefile-mode))

(autoload 'modulefile-mode "modulefile-mode"
  "Major mode for editing Modulefile scripts." t)
