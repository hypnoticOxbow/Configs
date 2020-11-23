;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(setq! doom-theme 'badwolf)
;; (setq! inferior-lisp-program "alisp")
;; (setq! sly-contribs )
(setq! display-line-numbers-type 't)

;; Turn off auth-sources, I already have pass to deal with this
;; (setq auth-sources nil)


(setq! doom-font (font-spec :family "PragmataPro Liga" :size 15))

;; (setq! doom-font (font-spec :family "Fira Code" :size 14))
;; (setq! doom-unicode-font (font-spec :family "Noto Sans Mono" :size 14))
;;
;;
;;


(setq! history-length 1000)
(put 'minibuffer-history 'history-length 50)
(put 'evil-ex-history 'history-length 50)
(put 'kill-ring 'history-length 25)

(add-to-list 'auto-mode-alist '("\\.prt$" . perl-mode))
(add-to-list 'auto-mode-alist '("\\.pddl$" . lisp-mode))
(add-to-list 'auto-mode-alist '("\\.lisp$" . lisp-mode))
(add-to-list 'auto-mode-alist '("\\.xc\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.pl$" . prolog-mode))


;; Load Silver
;;(require 'silver-mode)
;;(add-hook! 'silver-mode-hook #'rainbow-delimiters-mode)


(setq! ein:worksheet-enable-undo 't)
(after! pipenv
  (map!
   :localleader
   :map python-mode-map
   :desc "Send buffer to repl" "eb" #'python-shell-send-buffer
   :desc "Send defun to repl" "ef" #'python-shell-send-defun
   :desc "Send region to repl" "er" #'python-shell-send-region
   )

  (set-popup-rules!
    '(("^\\*python\\*" :regexp t :align 'right :width 0.5 :quit nil :ttl nil)
      )
    ))

(defadvice! no-errors/+org-inline-image-data-fn (_protocol link _description)
  :override #'+org-inline-image-data-fn
  "Interpret LINK as base64-encoded image data. Ignore all errors."
  (ignore-errors
    (base64-decode-string link)))

(setq org-superstar-headline-bullets-list '("■" "◆" "▲" "‣" "◘" "✿" "◉" "○" "✸" ))
(setq org-superstar-bullet-list '("■" "◆" "▲" "‣" "◘" "✿" "◉" "○" "✸" ))
(setq org-superstar-cycle-headline-bullets 'nil)

(defun my/org-mode-hook ()
  "Stop the org-level headers from increasing in height relative to the other text."
  (dolist (face '(org-level-1
                  org-level-2
                  org-level-3
                  org-level-4
                  org-level-5
                  outline-1
                  outline-2
                  outline-3
                  outline-4
                  outline-5))
    (set-face-attribute face nil :height 1.0)))

(add-hook 'org-mode-hook #'my/org-mode-hook)

(defun what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property pos 'read-face-name)
                  (get-char-property pos 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))


(defun my-org-screenshot ()
  "Take a screenshot into a time stamped unique-named file in the
same directory as the org-buffer and insert a link to this file."
  (interactive)
  (org-display-inline-images)
  (setq filename
        (concat
         (make-temp-name
          (concat (file-name-nondirectory (buffer-file-name))
                  "_imgs/"
                  (format-time-string "%Y%m%d_%H%M%S_")) ) ".png"))
  (unless (file-exists-p (file-name-directory filename))
    (make-directory (file-name-directory filename)))
                                        ; take screenshot
  (if (eq system-type 'darwin)
      (call-process "screencapture" nil nil nil "-i" filename))
  (if (eq system-type 'gnu/linux)
      (print (call-process "import" nil nil t filename) ))
                                        ; insert into file if correctly taken
  (if (file-exists-p filename)
      (insert (concat "[[file:" filename "]]"))))

(after! ein-notebook
  (set-popup-rules!
    '(("^\\*ein:.*\.ipynb" :ignore t :quit nil :ttl nil)
      ("\*ein: http://.*\.ipynb" :ignore t :quit nil :ttl nil)
      ("^\\*ein" :ignore t :quit nil :ttl nil)
      ("^\\*ein:notebooklist" :ignore t :quit nil :ttl nil))
    )
  (map! :leader
        (:prefix ("e" . "Emacs Ipython Notebook")
         "l" 'ein:login
         "r" 'ein:run
         "d" 'ein:stop))

  (map!
   :after ein-notebook
   :map ein:notebook-mode-map
   :localleader
   "y" 'ein:worksheet-copy-cell
   "p" 'ein:worksheet-yank-cell
   "d" 'ein:worksheet-kill-cell
   "h" 'ein:notebook-worksheet-open-prev-or-last
   "i" 'ein:worksheet-insert-cell-below
   "I" 'ein:worksheet-insert-cell-above
   "j" 'ein:worksheet-goto-next-input
   "k" 'ein:worksheet-goto-prev-input
   "l" 'ein:notebook-worksheet-open-next-or-first
   "H" 'ein:notebook-worksheet-move-prev
   "J" 'ein:worksheet-move-cell-down
   "K" 'ein:worksheet-move-cell-up
   "L" 'ein:notebook-worksheet-move-next
   "t" 'ein:worksheet-toggle-output
   "R" 'ein:worksheet-rename-sheet
   "RET" 'ein:worksheet-execute-cell-and-goto-next
   ;; Output
   "C-l" 'ein:worksheet-clear-output
   "C-S-l" 'ein:worksheet-clear-all-output
   ;;Console
   "C-o" 'ein:console-open
   ;; Merge cells
   "C-k" 'ein:worksheet-merge-cell
   "C-j" 'spacemacs/ein:worksheet-merge-cell-next
   "s" 'ein:worksheet-split-cell-at-point
   ;; Notebook
   "C-s" 'ein:notebook-save-notebook-command
   "C-r" 'ein:notebook-rename-command
   "1" 'ein:notebook-worksheet-open-1th
   "2" 'ein:notebook-worksheet-open-2th
   "3" 'ein:notebook-worksheet-open-3th
   "4" 'ein:notebook-worksheet-open-4th
   "5" 'ein:notebook-worksheet-open-5th
   "6" 'ein:notebook-worksheet-open-6th
   "7" 'ein:notebook-worksheet-open-7th
   "8" 'ein:notebook-worksheet-open-8th
   "9" 'ein:notebook-worksheet-open-last
   "+" 'ein:notebook-worksheet-insert-next
   "-" 'ein:notebook-worksheet-delete
   "x" 'ein:notebook-close
   "u" 'ein:worksheet-change-cell-type
   "fs" 'ein:notebook-save-notebook-command
   )
  (map!
   :after ein-notebook
   :map ein:notebook-mode-map
   "M-j" 'ein:worksheet-move-cell-down
   "M-k" 'ein:worksheet-move-cell-up
   "M-RET" nil
   :n "<C-return>" 'ein:worksheet-execute-cell-and-goto-next-km
   :n "<S-return>" 'ein:worksheet-execute-cell
   :n "M-RET" 'ein:worksheet-execute-cell
   :i "M-RET" 'ein:worksheet-execute-cell
   :i "<C-return>" 'ein:worksheet-execute-cell-and-goto-next-km
   :i "<S-return>" 'ein:worksheet-execute-cell
   :n "gj"         'ein:worksheet-goto-next-input
   :n "gk"         'ein:worksheet-goto-prev-input
   )

  ;; ;; keybindings mirror ipython web interface behavior
  ;; (evil-define-key 'insert ein:notebook-mode-map
  ;;   (kbd "<C-return>") 'ein:worksheet-execute-cell-and-goto-next
  ;;   (kbd "<S-return>") 'ein:worksheet-execute-cell)

  ;; (evil-define-key 'normal ein:notebook-mode-map
  ;;   ;; keybindings mirror ipython web interface behavior
  ;;   (kbd "<C-return>") 'ein:worksheet-execute-cell-and-goto-next
  ;;   (kbd "<S-return>") 'ein:worksheet-execute-cell
  ;;   "gj" 'ein:worksheet-goto-next-input
  ;;   "gk" 'ein:worksheet-goto-prev-input)
  )

;; (after! spell-fu
;;   (setq! ispell-personal-dictionary "/home/ian/.doom.d/personal-dict"))

;; (after! spell-fu
;;   (remove-hook! 'text-mode #'spell-fu-mode)
;;   (setq spell-fu-idle-delay 0.7))

(after! org
  (map! :map evil-org-mode-map
        :n "zs"  #'org-latex-preview)
  (evil-define-key 'normal org-mode-map (kbd "z s") #'org-latex-preview)
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 0.8))
  (add-to-list 'org-latex-packages-alist '("" "bbold" t))
  (setq org-link-file-path-type 'adaptive))

(after! tramp
  (add-to-list 'tramp-remote-path "/home/ikariniemi/.local/bin")
  (setq remote-file-name-inhibit-cache nil)
  (setq tramp-copy-size-limit 1000000)
  (setq tramp-inline-compress-start-size 1000000)
  (setq vc-ignore-dir-regexp
        (format "%s\\|%s"
                vc-ignore-dir-regexp
                tramp-file-name-regexp))
  (setq tramp-verbose 1)
  (setq auto-revert-buffer-list-filter 'magit-auto-revert-repository-buffers-p))

(after! centaur-tabs
  (evil-define-key 'normal centaur-tabs-mode-map (kbd "g l") #'centaur-tabs-forward)
  (evil-define-key 'normal centaur-tabs-mode-map (kbd "g h") #'centaur-tabs-backward))

(defun tramp-cleanup-everything ()
  (tramp-cleanup-all-buffers)
  (tramp-cleanup-all-connections))



(after! sly-stickers
  (map! :map sly-stickers--replay-mode-map
        "j" nil
        :n "j" nil
        :n "k" nil))

(map! :after coq-mode
      :map coq-mode-map
      :localleader
      (:prefix ("p" . "proof")
       "c" #'proof-assert-until-point-interative))





(use-package! sly-asdf
  :defer t
  :init
  (add-to-list 'sly-contribs 'sly-asdf 'append))



(after! evil-tex
  (setq! TeX-electric-sub-and-superscript 'nil)
  (map! :map evil-tex-mode-map
        :localleader
        :desc "Compile Document"    "a" #'TeX-command-run-all
        :desc "Insert Macro"    "m" #'TeX-insert-macro
        :desc "Kill Tex Job"    "k" #'TeX-kill-job
        :desc "View output"    "v" #'TeX-view
        :desc "Insert Environment"    "e" #'LaTeX-environment
        :desc "Insert Section template"    "s" #'LaTeX-section

        :desc "Fill and indent current environment"    "fe"  'LaTeX-fill-environment
        :desc "Fill and indent current paragraph"    "fp"  'LaTeX-fill-paragraph
        :desc "Fill and indent current region"    "fr"  'LaTeX-fill-region
        :desc "Fill and indent current section"         "fs"  'LaTeX-fill-section))


;; (use-package sly
;;   :ensure t
;;   :after magit-todos
;;   :bind
;;   (:map sly-mrepl-mode-map
;;    ("<C-up>" . sly-mrepl-previous-input-or-button)
;;    ("<C-down>" . sly-mrepl-next-input-or-button))
;;   :init
;;   (progn
;;     (setq sly-contribs '(sly-fancy sly-mrepl sly-company)))
;;   :config
;;   (progn
;;     (setq sly-lisp-implementations
;;           `((sbcl ("/usr/local/bin/sbcl")
;;                   :env ("SBCL_HOME=/usr/local/lib/sbcl")))
;;           sly-autodoc-use-multiline t
;;           sly-kill-without-query-p t
;;           sly-repl-history-remove-duplicates t
;;           sly-repl-history-trim-whitespaces t
;;           sly-net-coding-system 'utf-8-unix
;;           )
;;     (sly-setup '(sly-fancy sly-mrepl))
;;     (add-hook 'sly-mode-hook (lambda () (magit-todos-mode t)))))


;; (use-package sly-mrepl
;;   :ensure nil
;;   :after sly
;;   :config
;;   (progn
;;     (set-face-attribute 'sly-mrepl-output-face nil
;;                         :foreground "LightSalmon"
;;                         :background "black"
;;                         :weight 'normal)))



;; (map! :map sly-stickers--replay-mode-map
;;       :after sly-stickers--replay-mode
;;       :n "j" nil
;;       :n "k" nil)



(after! sly-mrepl
  (set-face-attribute 'sly-mrepl-output-face nil
                      :foreground "MediumTurquoise"
                      :weight 'normal))

(after! sly
  ;; (require 'sly-tramp)
  (add-to-list 'sly-contribs 'sly-tramp 'append)
  (setq sly-mrepl-eli-like-history-navigation t)


  (remove-hook! 'sly-mode-hook #'+common-lisp-init-sly-h)
  (remove-hook! 'sly-mode #'+common-lisp-init-sly-h)
  (setq spell-fu-idle-delay 0.7)

  (setq lispy-colon-p nil
        sly-autodoc-use-multiline t
        sly-kill-without-query-p t
        sly-repl-history-remove-duplicates t
        sly-repl-history-trim-whitespaces t
        sly-net-coding-system 'utf-8-unix)
  (setq sly-lisp-implementations
        '(
          (sbcl ("sbcl" "--core"
                 "/home/ian/sbcl.core-for-sly")
                :coding-system utf-8-unix)
          ;; (sbcl ("sbcl") :coding-system utf-8-unix)
          (ccl ("ccl") :coding-system utf-8-unix)
          ))
  (add-hook! 'lispy-mode-hook (semantic-mode -1))
  (setq common-lisp-hyperspec-root "file:///home/ian/.local/lib/HyperSpec/")
  (setq sly-auto-start 'never)
  ;; (add-hook 'sly-mode-hook #'lispy-mode)
  ;; (add-hook 'lispy-mode-hook #'lispyville-mode)
  (define-key sly-db-mode-map (kbd "j") #'next-line)
  (define-key sly-db-mode-map (kbd "k") #'previous-line)
  (define-key sly-db-mode-map (kbd "h") #'left-char)
  (define-key sly-db-mode-map (kbd "l") #'right-char)
  (define-key sly-inspector-mode-map (kbd "j") #'next-line)
  (define-key sly-inspector-mode-map (kbd "k") #'previous-line)
  (define-key sly-inspector-mode-map (kbd "h") #'left-char)
  (define-key sly-inspector-mode-map (kbd "l") #'right-char)
  (define-key sly-db-mode-map (kbd "C-o") #'sly-db-toggle-details)
  (evil-define-key 'normal sly-mode-map (kbd "g d") #'sly-edit-definition)

  (set-popup-rules!
    '(("^\\*sly-mrepl" :ignore t :quit nil :ttl nil)
      ("^\\*sly-compilation" :vslot 3 :ttl nil)
      ("^\\*sly-traces" :vslot 4 :ttl nil)
      ("^\\*sly-description" :vslot 5 :size 0.3 :ttl 0)
      ;; Do not display debugger or inspector buffers in a popup window. These
      ;; buffers are meant to be displayed with sufficient vertical space.
      ("^\\*sly-\\(?:db\\|inspector\\)" :ignore t))))

;; (map! :after sly-stickers--replay-mode
;;       :map sly-stickers--replay-mode-map
;;       ("j" #'next-line)
;;       ("k" #'previous-line))


;; (after! sly-stickers
;;   (define-key sly-stickers--replay-mode-map (kbd "j") #'next-line)
;;   (define-key sly-stickers--replay-mode-map (kbd "k") #'previous-line)
;;   (define-key sly-stickers--replay-mode-map (kbd "h") #'left-char)
;;   (define-key sly-stickers--replay-mode-map (kbd "l") #'right-char))



;; (after! org)



(setq-hook! 'markdown-mode-hook
  spell-fu-faces-exclude '(markdown-code-face
                           markdown-reference-face
                           markdown-link-face
                           markdown-url-face
                           markdown-markup-face
                           markdown-html-attr-value-face
                           markdown-html-attr-name-face
                           markdown-html-tag-name-face))


(after! lispyville
  (setq lispyville-key-theme
        '((operators normal)
          c-w
          (prettify insert visual)
          (atom-movement normal visual)
          slurp/barf-lispy
          additional
          additional-insert))
  (lispyville-set-key-theme))


(after! racket
  (set-popup-rules!
    '(("^\\*Racket-REPL\\*" :ignore t :quit nil :ttl nil))))


(map!
 :after sly
 :localleader
 :map lisp-mode-map
 :desc "Sly connect"          "." #'sly-connect
 (:prefix ("c" . "compile")
  :desc "Quicklisp load system" "q" #'sly-quickload
  :desc "ASDF compile and load system" "s" #'sly-asdf-load-system))


;; (map!
;;  :after ivy
;;  :localleader
;;  :map
;;  (:prefix ("f" . "compile")
;;   :desc "asdf compile and load system" "s" #'sly-asdf-load-system))

(after! forge
  (add-to-list 'forge-alist
               '("git.sift.net" "git.sift.net/api/v4"
                 "git.sift.net" forge-gitlab-repository)
               'append)
  (add-to-list 'forge-alist
               '("github.umn.edu" "github.umn.edu/api/v4"
                 "github.umn.edu" forge-github-repository)
               'append))


(map! :leader
      (:prefix-map ("b" . "buffer")
       :desc "Switch buffer other window" "o" #'switch-to-buffer-other-window)
      (:prefix-map ("f" . "file")
       :desc "Find file other window" "o" #'find-file-other-window))

(with-eval-after-load 'tex
  (add-to-list 'safe-local-variable-values
               '(TeX-command-extra-options . "-shell-escape")))


;; Tramp changes
(setq projectile-mode-line "Projectile")


(defun my-put-file-name-on-clipboard ()
  "Put the current file name on the clipboard"
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (with-temp-buffer
        (insert filename)
        (clipboard-kill-region (point-min) (point-max)))
      (message filename))))

(use-package! hy-mode
  :mode "\\.hy\\'"
  :interpreter "hy"
  :config
  (set-repl-handler! 'hy-mode #'hy-shell-start-or-switch-to-shell)
  (set-eval-handler! 'hy-mode #'hy-shell-eval-region)
  (set-company-backend! 'hy-mode 'company-hy)
  (setq! hy-shell--interpreter-args '("--repl-output-fn" "hy.contrib.hy-repr.hy-repr"))
  (set-lookup-handlers! 'hy-mode
    :documentation #'hy-shell-describe-thing-at-point)
  (add-hook 'hy-mode-hook #'rainbow-delimiters-mode)
  ;; (add-hook 'hy-mode-hook #'smartparens-mode)
  (set-popup-rules!
    '(("\\*Hy\\*" :ignore t :quit nil :ttl nil)))

  (map!
   (:localleader
    :map hy-mode-map
    :desc "Hy repl" "'" #'run-hy
    (:prefix ("e" . "evaluate")
     :desc "Evaluate buffer" "b" #'hy-shell-eval-buffer
     :desc "Evaluate last sexp" "e" #'hy-shell-eval-last-sexp
     :desc "Evaluate region" "r" #'hy-shell-eval-region
     :desc "Evaluate current form" "f" #'hy-shell-eval-current-form)
    (:prefix ("h" . "help")
     :desc "Describe thing at point" "d" #'hy-describe-thing-at-point)
    (:prefix ("t" . "trace")
     :desc "Set pdb trace at point" "t" #'hy-insert-pdb))))

(use-package! ob-hy
  :defer t
  ;; :init
  ;; (after! org-src
  ;;   (defalias 'org-babel-execute:hy #'org-babel-execute:hy)
  ;;   (add-to-list 'org-src-lang-modes '("hy" . hy)))
  )

(setq magit-revision-show-gravatars '("^Author:     " . "^Commit:     "))
(defun yank-github-link ()
  "Quickly share a github link of what you are seeing in a buffer. Yanks
a link you can paste in the browser."
  (interactive)
  (let* ((remote (or (magit-get-push-remote) "origin"))
         (url (magit-get "remote" remote "url"))
         (project (if (string-prefix-p "git" url)
                      (substring  url 15 -4)   ;; git link
                      (substring  url 19 -4))) ;; https link
         (link (format "https://github.com/%s/blob/%s/%s#L%d"
                       project
                       (magit-get-current-branch)
                       (magit-current-file)
                       (count-lines 1 (point)))))
    (kill-new link)))
