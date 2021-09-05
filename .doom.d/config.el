;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
;;
;;
;; A more complex, more lazy-loaded config
(setq! doom-theme 'doom-henna)
;; (setq! doom-henna-brighter-modeline 't)
;; (setq! inferior-lisp-program "alisp")
;; (setq! sly-contribs )
(setq! display-line-numbers-type 't)
(setq auto-save-default nil)


(setq! doom-font (font-spec :family "PragmataPro Liga" :size 15))

;; (setq! doom-font (font-spec :family "Fira Code" :size 14))
;; (setq! doom-unicode-font (font-spec :family "Noto Sans Mono" :size 14))
;;
;;
;;

;; Flyspell config (if we adopt it)
;; (map! :i "C-i" #'flyspell-auto-correct-word)

(defun number-region (start end)
  (interactive "r")
  (let* ((count 1)
     (indent-region-function (lambda (start end)
                   (save-excursion
                     (setq end (copy-marker end))
                     (goto-char start)
                     (while (< (point) end)
                       (or (and (bolp) (eolp))
                       (insert (format "%d. " count))
                       (setq count (1+ count)))
                       (forward-line 1))
                     (move-marker end nil)))))
    (indent-region start end)))

(setq lsp-pyls-plugins-pycodestyle-enabled nil)



(after! haskell-mode
  (set-popup-rule! "^\\*haskell\\*" :ignore t :quit nil :ttl nil)
  (setq lsp-haskell-hlint-on nil)
  (map! :map interactive-haskell-mode-map
         "C-p" #'haskell-interactive-mode-history-previous
         "C-n" #'haskell-interactive-mode-history-next
         "C-d" #'haskell-interactive-mode-kill-whole-line
        )
  (map! :localleader
        :map haskell-mode-map
        (:prefix ("e" . "evaluation")
         :desc "Load buffer" "b" #'haskell-process-load-or-reload
         )
        (:prefix ("r" . "repl")
         :desc "Restart process" "r" #'haskell-process-restart
         :desc "Repl clear" "c" #'haskell-process-clear
         :desc "Cd to dir" "d" #'haskell-process-cd
         )
        )
  )



(after! emojify
  ;; TODO: Find a way to make removing hooks work
  ;; (remove-hook! 'doom-first-buffer #'global-emojify-mode)
  ;; (remove-hook!  'global-emojify-mode #'doom-first-buffer)
  (add-hook! 'emacs-lisp-mode-hook #'emojify-mode)
  (add-hook! 'slack-mode-hook #'emojify-mode)
  (add-hook! 'forge-topic-mode-hook #'emojify-mode)
  )

(setq! history-length 2000)
(put 'minibuffer-history 'history-length 50)
(put 'evil-ex-history 'history-length 50)
(put 'kill-ring 'history-length 25)

(add-to-list 'auto-mode-alist '("\\.prt$" . perl-mode))
(add-to-list 'auto-mode-alist '("\\.pddl$" . lisp-mode))
(add-to-list 'auto-mode-alist '("\\.lisp$" . lisp-mode))
(add-to-list 'auto-mode-alist '("\\.xc\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.pl$" . prolog-mode))


;; Load Silver
(add-to-list 'load-path "~/.doom.d/silver-mode/")
(require 'silver-mode)
(add-hook! 'silver-mode-hook #'rainbow-delimiters-mode)


;; Compile mode changes
  ;; (evil-set-initial-state 'compilation-mode 'normal)

(map!
 :map special-mode-map
 :n "h" nil
 "h" nil
 )


;; (dolist (keymap evil-collection-compile-maps)

;;   (evil-collection-define-key nil keymap
;;     "g" nil)

;;   (evil-collection-define-key 'normal keymap
;;     (kbd "RET") 'compile-goto-error

;;     "go" 'compilation-display-error
;;     (kbd "S-<return>") 'compilation-display-error

;;     "gj" 'compilation-next-error
;;     "gk" 'compilation-previous-error
;;     (kbd "C-j") 'compilation-next-error
;;     (kbd "C-k") 'compilation-previous-error
;;     "[[" 'compilation-previous-file
;;     "]]" 'compilation-next-file
;;     "gr" 'recompile))

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
   :n "gk"         'ein:worksheet-goto-prev-input))



;; (defun my-org-screenshot ()
;;   "Take a screenshot into a time stamped unique-named file in the
;; same directory as the org-buffer and insert a link to this file."
;;   (interactive)
;;   (org-display-inline-images)
;;   (setq filename
;;         (concat
;;          (make-temp-name
;;           (concat (file-name-nondirectory (buffer-file-name))
;;                   "_imgs/"
;;                   (format-time-string "%Y%m%d_%H%M%S_")) ) ".png"))
;;   (unless (file-exists-p (file-name-directory filename))
;;     (make-directory (file-name-directory filename)))
;;                                         ; take screenshot
;;   (if (eq system-type 'darwin)
;;       (call-process "screencapture" nil nil nil "-i" filename))
;;   (if (eq system-type 'gnu/linux)
;;       (print (call-process "import" nil nil t filename) ))
;;                                         ; insert into file if correctly taken
;;   (if (file-exists-p filename)
;;       (insert (concat "[[file:" filename "]]"))))



;; (defun org-mode-reftex-setup ()
;;   (load-library "reftex")
;;   (and (buffer-file-name) (file-exists-p (buffer-file-name))
;;        (progn
;;      ;enable auto-revert-mode to update reftex when bibtex file changes on disk
;;      (global-auto-revert-mode t)
;;      (reftex-parse-all)
;;      ;add a custom reftex cite format to insert links
;;      (reftex-set-cite-format "** [[papers:%l][%l]]: %t \n"
;;    )))
;;   ;; (define-key org-mode-map (kbd "C-c )") 'reftex-citation)
;; )

;; (add-hook 'org-mode-hook 'org-mode-reftex-setup)



;; (require 'color-theme)
;; (color-theme-initialize)

(defadvice! no-errors/+org-inline-image-data-fn (_protocol link _description)
  :override #'+org-inline-image-data-fn
  "Interpret LINK as base64-encoded image data. Ignore all errors."
  (ignore-errors
    (base64-decode-string link)))

(after! ox-hugo
  (add-to-list 'org-hugo-external-file-extensions-allowed-for-copying '"bmp" 'append))

(setq org-superstar-headline-bullets-list '("■" "◆" "▲" "‣" "◘" "◉" "○" "■" "◆" "▲" "‣" "◘" "◉" ))
(setq org-superstar-bullet-list '("■" "◆" "▲" "‣" "◘" "◉" "○" "■" "◆" "▲" "‣" "◘" "◉" ))
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

(with-eval-after-load 'org
  (plist-put org-format-latex-options :background 'default))

(defun diary-limited-cyclic (recurrences interval m d y)
  "For use in emacs diary. Cyclic item with limited number of recurrences.
Occurs every INTERVAL days, starting on YYYY-MM-DD, for a total of
RECURRENCES occasions."
  (let ((startdate (calendar-absolute-from-gregorian (list m d y)))
        (today (calendar-absolute-from-gregorian date)))
    (and (not (minusp (- today startdate)))
         (zerop (% (- today startdate) interval))
         (< (floor (- today startdate) interval) recurrences))))

(defun what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property pos 'read-face-name)
                  (get-char-property pos 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))



;; (map!
;;  :after org
;;  :localleader
;;  :map org-mode-map
;;  (:prefix ("c" . "compile")
;;   :desc "Quicklisp load system" "q" #'sly-quickload
;;   :desc "ASDF compile and load system" "s" #'sly-asdf-load-system))


;; (after! spell-fu
;;   (setq! ispell-personal-dictionary "/home/ian/.doom.d/personal-dict"))

;; (after! spell-fu
;;   (remove-hook! 'text-mode #'spell-fu-mode)
;;   (setq spell-fu-idle-delay 0.7))

(after! org
  (setq org-hide-emphasis-markers t)
  (map! :map evil-org-mode-map
        :n "zs"  #'org-latex-preview)
  (evil-define-key 'normal org-mode-map (kbd "z s") #'org-latex-preview)
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))
  (add-to-list 'org-latex-packages-alist
               '("" "tikz" t))
  (eval-after-load "preview"
    '(add-to-list 'preview-default-preamble "\\PreviewEnvironment{tikzpicture}" t))
  (setq org-preview-latex-default-process 'imagemagick)
  (add-to-list 'org-latex-packages-alist '("" "bbold" t))
  (setq org-link-file-path-type 'adaptive))

(after! ox-pandoc
  (setq org-pandoc-options-for-latex-pdf '((pdf-engine . "xelatex")))
  )

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

(map! :after coq-mode
      :map coq-mode-map
      :localleader
      (:prefix ("p" . "proof")
       "c" #'proof-assert-until-point-interative))


(after! evil-tex
  (setq! TeX-electric-sub-and-superscript 'nil)
  (map! :map evil-tex-mode-map
        :localleader
        :desc "Compile Document"    "a" #'TeX-command-run-all
        :desc "Insert Macro"    "m" #'TeX-insert-macro
        :desc "Insert item"    "i" #'LaTeX-insert-item
        :desc "Kill Tex Job"    "k" #'TeX-kill-job
        :desc "View output"    "v" #'TeX-view
        :desc "Insert Environment"    "e" #'LaTeX-environment
        :desc "Insert Section template"    "s" #'LaTeX-section

        :desc "Fill and indent current environment"    "fe"  'LaTeX-fill-environment
        :desc "Fill and indent current paragraph"    "fp"  'LaTeX-fill-paragraph
        :desc "Fill and indent current region"    "fr"  'LaTeX-fill-region
        :desc "Fill and indent current section"         "fs"  'LaTeX-fill-section))

(after! sly-stickers
  (map! :map sly-stickers--replay-mode-map
        "j" nil
        :n "j" nil
        :n "k" nil))

(use-package! sly-asdf
  :defer t
  :init
  (add-to-list 'sly-contribs 'sly-asdf 'append))




(after! sly-mrepl
  (set-face-attribute 'sly-mrepl-output-face nil
                      :foreground "MediumTurquoise"
                      :weight 'normal))
(after! sly-tramp
  (add-to-list 'sly-filename-translations
               (sly-create-filename-translator
                :machine-instance "#x70a7203"
                :remote-host "odysseus.sift.net"
                :username "ikariniemi")))

(after! sly
  (add-to-list 'sly-contribs 'sly-tramp 'append)

  (setq sly-scratch-file "/home/ian/common-lisp/scratch.lisp")
  (add-to-list 'sly-contribs 'sly-scratch 'append)
  (setq sly-mrepl-eli-like-history-navigation t)
  (remove-hook! 'sly-mode-hook #'+common-lisp-init-sly-h)
  (remove-hook! 'sly-mode #'+common-lisp-init-sly-h)
  (setq lispy-colon-p nil
        sly-autodoc-use-multiline t
        sly-kill-without-query-p t
        sly-repl-history-remove-duplicates t
        sly-repl-history-trim-whitespaces t
        sly-net-coding-system 'utf-8-unix)
  (let ((dumper "/home/ian/build/lisp-repl-core-dumper/lisp-repl-core-dumper"))
    (setq sly-lisp-implementations
          `(
            ;; (sbcl (,dumper "sbcl" "alexandria"))
            (sbcl ("sbcl") :coding-system utf-8-unix)
            (ccl (,dumper "ccl")))))
  ;; (setq sly-lisp-implementations
  ;;       '(
  ;;         (sbcl ("sbcl" "--core"
  ;;                "/home/ian/sbcl.core-for-sly")
  ;;               :coding-system utf-8-unix)
  ;;         ;; (sbcl ("sbcl") :coding-system utf-8-unix)
  ;;         (ccl ("ccl") :coding-system utf-8-unix)
  ;;         ))
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

(map! :leader
      (:prefix-map ("a" . "applications")
       (:prefix ("s" . "slack")
        :desc "Slack Start" "s" #'slack-start)))

(map!
 :after slack
 :leader
 (:prefix-map ("a" . "applications")
  (:prefix ("s" . "slack")
   :desc "Change team" "t" #'slack-change-current-team
   :desc "Open channel" "c" #'slack-channel-select
   :desc "IM User" "i" #'slack-im-select
   :desc "All threads" "a" #'slack-all-threads
   :desc "File upload" "f" #'slack-file-upload
   ;; uncomment when it starts working :(
   ;; :desc "All unreads" "u" #'slack-
   )))

(map!
 :after sly
 :localleader
 :map lisp-mode-map
 :desc "Sly connect"          "." #'sly-connect
 (:prefix ("c" . "compile")
  :desc "Quicklisp load system" "q" #'sly-quickload
  :desc "ASDF compile and load system" "s" #'sly-asdf-load-system
  :desc "ASDF compile and test system" "t" #'sly-asdf-test-system)
 (:prefix ("g" . "goto")
  :desc "Go to scratch buffer"              "s" #'sly-scratch
  :desc "Next sticker"         "k" #'sly-stickers-next-sticker
  :desc "Previous sticker"     "K" #'sly-stickers-prev-sticker)
 )

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




(setq-hook! 'markdown-mode-hook
  spell-fu-faces-exclude '(markdown-code-face
                           markdown-reference-face
                           markdown-link-face
                           markdown-url-face
                           markdown-markup-face
                           markdown-html-attr-value-face
                           markdown-html-attr-name-face
                           markdown-html-tag-name-face))


(after! racket
  (setq racket-xp-after-change-refresh-delay 5)
  (set-popup-rules!
    '(("^\\*Racket-REPL\\*" :ignore t :quit nil :ttl nil)
      ("^*.rkt" :ignore t :quit nil :ttl nil)
      )))

(after! forge
  (add-to-list 'forge-alist
               '("git.sift.net" "git.sift.net/api/v4"
                 "git.sift.net" forge-gitlab-repository)
               'append)
  (add-to-list 'forge-alist
               '("github.umn.edu" "github.umn.edu/api/v4"
                 "github.umn.edu" forge-github-repository)
               'append)
  (map! (:map forge-topic-mode-map
         "l" nil
         "h" nil
         "a" nil)
        (:map )
        )

  )


(map! :leader
      (:prefix-map ("b" . "buffer")
       :desc "Switch buffer other window" "o" #'switch-to-buffer-other-window)
      (:prefix-map ("f" . "file")
       :desc "Find file other window" "o" #'find-file-other-window))

(with-eval-after-load 'tex
  (add-to-list 'safe-local-variable-values
               '(TeX-command-extra-options . "-shell-escape")))

(setq-default indent-tabs-mode nil)

;; Tramp changes
(setq projectile-mode-line "Projectile")

;; Agda
;; (load-file (let ((coding-system-for-read 'utf-8))
;;                 (shell-command-to-string "agda-mode locate")))
(setq auto-mode-alist
   (append
     '(("\\.agda\\'" . agda2-mode)
       ("\\.lagda.md\\'" . agda2-mode))
     auto-mode-alist))

(after! agda2-mode
  (map! :map agda2-mode-map
        :localleader
        "i" #'agda2-search-about-toplevel
        ))


(after! rustic
  (map!
   (:localleader
    :map rustic-mode-map
    :desc "Lookup rust docs for term" "d" #'rustic-doc-search))

  (set-popup-rules!
    '(("\\*rustic-compilation\\*" :ignore t :quit nil :ttl nil)))
  )

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
(use-package! counsel-jq
  :defer t
  ;; :init
  ;; (after! org-src
  ;;   (defalias 'org-babel-execute:hy #'org-babel-execute:hy)
  ;;   (add-to-list 'org-src-lang-modes '("hy" . hy)))
  )

(use-package! alert
  :commands (alert)
  :init
  (setq alert-default-style 'libnotify))

(use-package! slack
  :commands (slack-start)
  :defer t
  :init
  (setq slack-buffer-emojify t) ;; if you want to enable emoji, default nil
  (setq slack-prefer-current-team t)
  :config
  (slack-register-team
   :name "melt"
   :default t
   :token (auth-source-pick-first-password
           :host "melt-umn.slack.com"
           :user "karin010@umn.edu")
   :subscribed-channels '((help general))
   :full-and-display-names t)

  (slack-register-team
   :name "graphics"
   :default nil
   :token (auth-source-pick-first-password
           :host "csci5607compg-3bh8296.slack.com"
           :user "karin010@umn.edu")
   :subscribed-channels '((general))
   :full-and-display-names t)

  (add-hook! 'slack-mode-hook #'emojify-mode)
  (set-face-attribute 'slack-mrkdwn-code-face nil :foreground "#e74c3c" )
  (set-face-attribute 'slack-mrkdwn-code-block-face nil :foreground "#e74c3c" )

  (evil-define-key 'normal slack-info-mode-map
    ",u" 'slack-room-update-messages)
  (evil-define-key 'normal slack-mode-map
    ",c" 'slack-buffer-kill
    ",ra" 'slack-message-add-reaction
    ",rr" 'slack-message-remove-reaction
    ",rs" 'slack-message-show-reaction-users
    ",pl" 'slack-room-pins-list
    ",pa" 'slack-message-pins-add
    ",pr" 'slack-message-pins-remove
    ",mm" 'slack-message-write-another-buffer
    ",me" 'slack-message-edit
    ",md" 'slack-message-delete
    ",u" 'slack-room-update-messages
    ",2" 'slack-message-embed-mention
    ",3" 'slack-message-embed-channel
    "\C-n" 'slack-buffer-goto-next-message
    "\C-p" 'slack-buffer-goto-prev-message)
  (evil-define-key 'normal slack-edit-message-mode-map
    ",k" 'slack-message-cancel-edit
    ",s" 'slack-message-send-from-buffer
    ",2" 'slack-message-embed-mention
    ",3" 'slack-message-embed-channel))


(add-hook
 'compilation-mode-hook
 'visual-line-mode
 )

(after! magit
  (map! (:map magit-blob-mode-map
         "n" nil
         "p" nil)
        (:map forge-topic-mode-map
         "l" nil
         "h" nil
         "a" nil)
        )
  (setq magit-revision-show-gravatars '("^Author:     " . "^Commit:     "))
  (defun my-wrap-lines ()
    "Disable `truncate-lines' in the current buffer."
    (setq truncate-lines nil))

  (add-hook 'forge-topic-mode-hook #'my-wrap-lines)


  )



(defun yank-github-link ()
  "Quickly share a github link of what you are seeing in a buffer. Yanks
a link you can paste in the browser."
  (interactive)
  (let* ((remote (or (magit-get-push-remote) "origin"))
         (url (magit-get "remote" remote "url"))
         (project (if (string-prefix-p "git" url)
                      (substring  url 15 -4) ;; git link
                    (substring  url 19 -4))) ;; https link
         (link (format "https://github.com/%s/blob/%s/%s#L%d"
                       project
                       (magit-get-current-branch)
                       (magit-current-file)
                       (count-lines 1 (point)))))
    (kill-new link)))



(defun my-org-babel-execute-haskell-blocks ()
  "Wraps :{ and :} around all multi-line blocks and then evaluates the source block.
Multi-line blocks are those where all non-indented, non-comment lines are declarations using the same token."
  (interactive)
  (save-excursion
    ;; jump to top of source block
    (my-org-jump-to-top-of-block)
    (forward-line)
    ;; get valid blocks
    (let ((valid-block-start-ends (seq-filter #'my-haskell-block-valid-p (my-get-babel-blocks))))
      (mapcar #'my-insert-haskell-braces valid-block-start-ends)
      (org-babel-execute-src-block)
      (mapcar #'my-delete-inserted-haskell-braces (reverse valid-block-start-ends)))))


(defun my-get-blocks-until (until-string)
  (let ((block-start nil)
        (block-list nil))
    (while (not (looking-at until-string))
      (if (looking-at "[[:space:]]*\n")
          (when (not (null block-start))
            (setq block-list (cons (cons block-start (- (point) 1))
                                   block-list)
                  block-start nil))
        (when (null block-start)
          (setq block-start (point))))
      (forward-line))
    (when (not (null block-start))
      (setq block-list (cons (cons block-start (- (point) 1))
                             block-list)))))

(defun my-get-babel-blocks ()
  (my-get-blocks-until "#\\+end_src"))

(defun my-org-jump-to-top-of-block ()
  (forward-line)
  (org-previous-block 1))

(defun my-empty-line-p ()
  (beginning-of-line)
  (= (char-after) 10))

(defun my-haskell-type-declaration-line-p ()
  (beginning-of-line)
  (and (not (looking-at "--"))
       (looking-at "^.*::.*$")))

(defun my-insert-haskell-braces (block-start-end)
  (let ((block-start (car block-start-end))
        (block-end (cdr block-start-end)))
    (goto-char block-end)
    (insert "\n:}")
    (goto-char block-start)
    (insert ":{\n")))


(defun my-delete-inserted-haskell-braces (block-start-end)
  (let ((block-start (car block-start-end))
        (block-end (cdr block-start-end)))
    (goto-char block-start)
    (delete-char 3)
    (goto-char block-end)
    (delete-char 3)))


(defun my-get-first-haskell-token ()
  "Gets all consecutive non-whitespace text until first whitespace"
  (save-excursion
    (beginning-of-line)
    (let ((starting-point (point)))
      (re-search-forward ".*?[[:blank:]\n]")
      (goto-char (- (point) 1))
      (buffer-substring-no-properties starting-point (point)))))


(defun my-haskell-declaration-line-p ()
  (beginning-of-line)
  (or (looking-at "^.*=.*$")  ;; has equals sign
      (looking-at "^.*\n[[:blank:]]*|")
      (looking-at "^.*where[[:blank:]]*$")))


(defun my-haskell-block-valid-p (block-start-end)
  (let ((block-start (car block-start-end))
        (block-end (cdr block-start-end))
        (line-count 0))
        (save-excursion
          (goto-char block-start)
          (let ((token 'nil)
                (is-valid t))
            ;; eat top comments
            (while (or (looking-at "--")
                       (looking-at "{-"))
              (forward-line))
            (when (my-haskell-type-declaration-line-p)
              (progn
                (setq token (my-get-first-haskell-token)
                      line-count 1)
                (forward-line)))
            (while (<= (point) block-end)
              (let ((current-token (my-get-first-haskell-token)))
                (cond ((string= current-token "") ; line with indentation
                       (when (null token) (setq is-valid nil))
                       (setq line-count (+ 1 line-count)))
                      ((or (string= (substring current-token 0 2) "--") ;; skip comments
                           (string= (substring current-token 0 2) "{-"))
                       '())
                      ((and (my-haskell-declaration-line-p)
                            (or (null token) (string= token current-token)))
                       (setq token current-token
                             line-count (+ 1 line-count)))
                      (t (setq is-valid nil)
                         (goto-char (+ 1 block-end))))
                (forward-line)))
            (and is-valid (> line-count 1))))))
