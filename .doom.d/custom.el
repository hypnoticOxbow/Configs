(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#21272e" "#e74c3c" "#53df83" "#ECBE7B" "#56b5c2" "#FFB8D1" "#56b6c2" "#f8f8f0"])
 '(auth-source-save-behavior nil)
 '(custom-safe-themes
   '("74ba9ed7161a26bfe04580279b8cad163c00b802f54c574bfa5d924b99daa4b9" default))
 '(fci-rule-color "#2c313a")
 '(jdee-db-active-breakpoint-face-colors (cons "#10151a" "#e74c3c"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#10151a" "#53df83"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#10151a" "#737c8c"))
 '(objed-cursor-color "#e74c3c")
 '(org-agenda-files
   '("~/Nextcloud/Notes/neo-fuzz.org" "~/Nextcloud/Notes/homer-meetings.org" "~/Nextcloud/Notes/school.org" "~/Nextcloud/Notes/homer.org" "/home/ian/org/org-check.org" "/home/ian/org/recommendations.org" "/home/ian/org/todo.org"))
 '(pdf-view-midnight-colors (cons "#f8f8f0" "#21272e"))
 '(rustic-ansi-faces
   ["#21272e" "#e74c3c" "#53df83" "#ECBE7B" "#56b5c2" "#FFB8D1" "#56b6c2" "#f8f8f0"])
 '(safe-local-variable-values
   '((Package . CL-USER)
     (package . net\.html\.generator)
     (Package . CL-PPCRE)
     (Package . FLEXI-STREAMS)
     (Syntax . ANSI-Common-Lisp)
     (Base . 10)
     (Package . CL-FAD)
     (Syntax . COMMON-LISP)
     (TeX-command-extra-options . -shell-escape)
     (TeX-command-extra-options . --shell-escape)
     (TeX-command-extra-options . "-g")
     (eval add-to-list 'org-export-exclude-tags "TOC")
     (eval local-set-key
           (kbd "<f12>")
           '(lambda nil
              (interactive)
              (org-babel-goto-named-src-block "make-portrait")
              (org-babel-execute-src-block)
              (outline-hide-sublevels 1)))
     (eval local-set-key
           (kbd "<f11>")
           '(lambda nil
              (interactive)
              (org-babel-goto-named-src-block "make-readme")
              (org-babel-execute-src-block)
              (outline-hide-sublevels 1)))
     (eval progn
           (visual-line-mode t)
           (require 'ox-extra)
           (ox-extras-activate
            '(ignore-headlines)))
     (Syntax . Common-Lisp)
     (package . net\.aserve)
     (TeX-command-extra-options . "-shell-escape")))
 '(vc-annotate-background "#21272e")
 '(vc-annotate-color-map
   (list
    (cons 20 "#53df83")
    (cons 40 "#86d480")
    (cons 60 "#b9c97d")
    (cons 80 "#ECBE7B")
    (cons 100 "#ea9866")
    (cons 120 "#e87251")
    (cons 140 "#e74c3c")
    (cons 160 "#ef706d")
    (cons 180 "#f7939f")
    (cons 200 "#FFB8D1")
    (cons 220 "#f7949f")
    (cons 240 "#ef706d")
    (cons 260 "#e74c3c")
    (cons 280 "#ca5850")
    (cons 300 "#ad6464")
    (cons 320 "#907078")
    (cons 340 "#2c313a")
    (cons 360 "#2c313a")))
 '(vc-annotate-very-old-color nil)
 '(warning-suppress-log-types
   '(((undo discard-info))
     ((undo discard-info))
     ((undo discard-info))
     ((undo discard-info))))
 '(warning-suppress-types
   '(((undo discard-info))
     ((undo discard-info))
     ((undo discard-info))
     ((undo discard-info))
     ((undo discard-info)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
