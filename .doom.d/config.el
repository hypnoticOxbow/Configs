;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(setq! doom-theme 'badwolf)
;; (setq! inferior-lisp-program "alisp")
;; (setq! sly-contribs )
(setq! display-line-numbers-type 'relative)




(setq! doom-font (font-spec :family "Fira Mono" :size 32))

(setq! history-length 100)
(put 'minibuffer-history 'history-length 50)
(put 'evil-ex-history 'history-length 50)
(put 'kill-ring 'history-length 25)

(add-to-list 'auto-mode-alist '("\\.prt$" . perl-mode))
(add-to-list 'auto-mode-alist '("\\.pddl$" . lisp-mode))
(add-to-list 'auto-mode-alist '("\\.lisp$" . lisp-mode))



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
  (setq auto-revert-buffer-list-filter 'magit-auto-revert-repository-buffers-p)
  )

(after! centaur-tabs
  (define-key centaur-tabs-mode-map (kbd "<f6>") #'centaur-tabs-forward)
  (define-key centaur-tabs-mode-map (kbd "<f5>") #'centaur-tabs-backward)
  (evil-define-key 'normal centaur-tabs-mode-map (kbd "g l") #'centaur-tabs-forward)
  (evil-define-key 'normal centaur-tabs-mode-map (kbd "g h") #'centaur-tabs-backward)
  )

;; (defun my-dpi ()
;;   (let* ((attrs (car (display-monitor-attributes-list)))
;;          (size (assoc 'mm-size attrs))
;;          (sizex (cadr size))
;;          (res (cdr (assoc 'geometry attrs)))
;;          (resx (- (caddr res) (car res)))
;;          dpi)
;;     (catch 'exit
;;       ;; in terminal
;;       (unless sizex
;;         (throw 'exit 10))
;;       ;; on big screen
;;       (when (> sizex 1000)
;;         (throw 'exit 10))
;;       ;; DPI
;;       (* (/ (float resx) sizex) 25.4))))

;; (defun my-preferred-font-size ()
;;   (let ( (dpi (my-dpi)) )
;;   (cond
;;     ((< dpi 110) 10)
;;     ((< dpi 130) 11)
;;     ((< dpi 160) 12)
;;     (t 12))))

;; (defvar my-preferred-font-size (my-preferred-font-size))

;; (defvar my-regular-font
;;   (cond
;;    ((eq window-system 'x) (format "DejaVu Sans Mono-%d:weight=normal" my-preferred-font-size))
;;    ((eq window-system 'w32) (format "Courier New-%d:antialias=none" my-preferred-font-size))))
;; (defvar my-symbol-font
;;   (cond
;;    ((eq window-system 'x) (format "DejaVu Sans Mono-%d:weight=normal" my-preferred-font-size))
;;    ((eq window-system 'w32) (format "DejaVu Sans Mono-%d:antialias=none" my-preferred-font-size))))

;; (cond
;;  ((eq window-system 'x)
;;   (if (and (fboundp 'find-font) (find-font (font-spec :name my-regular-font)))
;;       (set-frame-font my-regular-font)
;;     (set-frame-font "7x14")))
;;  ((eq window-system 'w32)
;;   (set-frame-font my-regular-font)
;;   (set-fontset-font nil 'cyrillic my-regular-font)
;;   (set-fontset-font nil 'greek my-regular-font)
;;   (set-fontset-font nil 'phonetic my-regular-font)
;;   (set-fontset-font nil 'symbol my-symbol-font)))
;; :bind
;; ("<f6>" . centaur-tabs-forward)
;; ("<f5>" . centaur-tabs-backward)
;; ("C-c t" . centaur-tabs-counsel-switch-group)
;; (:map evil-normal-state-map
;;       ("g l" . centaur-tabs-forward)
;;       ("g h" . centaur-tabs-backward)
;;       )
;;k
;;


(defun tramp-cleanup-everything ()
 (tramp-cleanup-all-buffers)
 (tramp-cleanup-all-connections)
 )


(map! :after coq-mode
      :map coq-mode-map
      :localleader
      (:prefix ("p" . "proof")
        "c" #'proof-assert-until-point-interative))




;; Sly config
;;

;; (use-package! sly-tramp
;;   :defer t
;;   :load-path "/home/ikariniemi/.emacs.d/.local/straight/build/sly/contrib/"
;;   :init
;;   (add-to-list 'sly-contribs 'sly-tramp 'append)
;;   )

(use-package! sly-asdf
  :defer t
  :init
  (add-to-list 'sly-contribs 'sly-asdf 'append))

(use-package! sly-quicklisp
  :defer t
  :init
  (add-to-list 'sly-contribs 'sly-quicklisp 'append))



(after! sly
  ;; (require 'sly-tramp)
  (add-to-list 'sly-contribs 'sly-tramp 'append)
  (setq lispy-colon-p nil)
  (setq sly-lisp-implementations
        '((alisp ("alisp" "-quiet"))
          (sbcl  ("sbcl") :coding-system utf-8-unix)
          ))
  (add-hook! 'lispy-mode-hook (semantic-mode -1))
  (setq common-lisp-hyperspec-root "file:///home/ian/.local/lib/HyperSpec/" )
  (add-hook 'sly-mode-hook #'lispy-mode)
  (add-hook 'lispy-mode-hook #'lispyville-mode)
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

  ;; (add-to-list 'sly-filename-translations
  ;;              (sly-create-filename-translator
  ;;               :machine-instance "achilles"
  ;;               :remote-host "achilles.sift.net"
  ;;               :username "ikariniemi"))
  ;; sly-tramp

  )

;; (after! sly-tramp
;;   (add-to-list 'sly-file-name-translations
;;                (sly-create-filename-translator
;;                 :machine-instance "achilles"
;;                 :remote-host "achilles.sift.net"
;;                 :username "ikariniemi"))
;;   )

(after! sly-stickers
  (define-key sly-stickers--replay-mode-map (kbd "j") #'next-line)
  (define-key sly-stickers--replay-mode-map (kbd "j") #'next-line)
  (define-key sly-stickers--replay-mode-map (kbd "k") #'previous-line)
  (define-key sly-stickers--replay-mode-map (kbd "h") #'left-char)
  (define-key sly-stickers--replay-mode-map (kbd "l") #'right-char)
  )




(map!
 :after sly
 :localleader
 :map lisp-mode-map
 (:prefix ("c" . "compile")
   :desc "asdf compile and load system"        "s" #'sly-asdf-load-system))

;; (map!
;;  :after sly
;;  :map sly-stickers--replay-mode-map
;;  (def "j" #'next-line
;;            "go down")
;;  (def "k" #'previous-line
;;            "go up")
;;  (def "h" #'left-char
;;            "go left")
;;  (def "h" #'right-char
;;            "go right")
;;  )



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
