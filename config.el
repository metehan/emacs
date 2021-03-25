;; * Look and feel

;; ** Start maximised (cross-platf)
(add-hook 'window-setup-hook 'toggle-frame-maximized t)

;; ** Don't ask to quit
(setq confirm-kill-emacs nil)

;; ** Modeline adjustments
(setq doom-modeline-major-mode-icon t)

;; ** lsp always show breadcrumb
(setq lsp-headerline-breadcrumb-enable t)

;; ** doom-gruvbox for the theme
; doom-theme 'doom-gruvbox
;(setq display-line-numbers-type t)
(setq display-line-numbers-type 'relative)

;; ** error in treemacs icons
(doom-themes-treemacs-config)
(after! treemacs
        (treemacs-load-theme "doom-colors"))

;; ** Outshine mini mode for all major modes
(add-hook 'prog-mode-hook 'outshine-mode)

;; ** Font
(setq doom-font (font-spec :family "Noto Mono" :size 18))

;; ** rgrep ignore some folders
(eval-after-load 'grep
                 '(progn
                   (add-to-list 'grep-find-ignored-directories "tmp")
                   (add-to-list 'grep-find-ignored-directories "cljs-runtime")
                   (add-to-list 'grep-find-ignored-directories ".shadow-cljs")
                   (add-to-list 'grep-find-ignored-directories "node_modules")
                   (add-to-list 'grep-find-ignored-directories ".bundle")
                   (add-to-list 'grep-find-ignored-directories "auto")
                   (add-to-list 'grep-find-ignored-directories "env")
                   (add-to-list 'grep-find-ignored-directories "venv")
                   (add-to-list 'grep-find-ignored-directories ".pytest_cache")
                   (add-to-list 'grep-find-ignored-directories "elpa")))
(setq wgrep-enable-key (kbd "C-c C-c"))
(add-hook 'grep-mode-hook (lambda () (toggle-truncate-lines 1)))

;ORG Mode Settings
(after! org
  (require 'org-bullets)  ; Nicer bullets in org-mode
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (setq org-directory "~/Documents/Org/"
        org-agenda-files '("~/Documents/Org/agenda.org")
        org-default-notes-file (expand-file-name "notes.org" org-directory)
        org-ellipsis " ▼ "
        org-log-done 'time
        org-journal-dir "~/Documents/Org/journal/"
        org-journal-date-format "%B %d, %Y (%A)"
        org-journal-file-format "%Y-%m-%d.org"
        org-hide-emphasis-markers t
        ;; ex. of org-link-abbrev-alist in action
        ;; [[arch-wiki:Name_of_Page][Description]]
        org-link-abbrev-alist    ; This overwrites the default Doom org-link-abbrev-list
          '(("ddg" . "https://duckduckgo.com/?q=")
            ("wiki" . "https://en.wikipedia.org/wiki/"))
        org-todo-keywords        ; This overwrites the default Doom org-todo-keywords
          '((sequence
             "TODO(t)"           ; A task that is ready to be tackled
             "PROJ(p)"           ; A project that contains other tasks
             "WAIT(w)"           ; Something is holding up this task
             "|"                 ; The pipe necessary to separate "active" states and "inactive" states
             "DONE(d)"           ; Task has been completed
             "CANCELLED(c)" )))) ; Task has been cancelled
