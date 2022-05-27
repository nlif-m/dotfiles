(defun go-new-module (name)
  "Create a new dir in $GOPATH/src/name/name.go"
  (interactive "sWhat name of new module ? ")
  (setq dir (concat (expand-file-name "~/golang/src/") name ))
  (setq file (concat dir "/" name ".go"))
  (setq command (concat "go mod init " name))
  (if (f-exists? dir)
      (message "ERROR: %s already exists" name)
    (progn
      (mkdir dir)
      (find-file file)
      (shell-command command))))

(add-hook 'before-save-hook 'gofmt-before-save)
