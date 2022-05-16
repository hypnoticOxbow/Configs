;; -*- no-byte-compile: t; -*-
;;; .doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:host github :repo "username/repo"))
;; (package! builtin-package :disable t)
;; (package! badwolf-theme)
;; (package! sly :pin "68561f1b7b66fa0240766ece836bb04da31ea17d")
;; (package! sly-macrostep :pin "5113e4e926cd752b1d0bcc1508b3ebad5def5fad")
;; (package! sly-repl-ansi-color :pin "b9cd52d1cf927bf7e08582d46ab0bcf1d4fb5048")
(package! sly-asdf)
(package! sly-quicklisp)
(package! common-lisp-snippets)
(package! ob-hy)
;; (package! counsel-jq)

(package! alert)
(package! slack)

(package! evil-escape :disable t)

(package! org-pandoc-import
  :recipe (:host github
           :repo "tecosaur/org-pandoc-import"
           :files ("*.el" "filters" "preprocessors")))

(package! frames-only-mode :recipe (:host github :repo "davidshepherd7/frames-only-mode"))
;; (package! polymode)
;; (package! org-agda-mode :recipe (:host github :repo "alhassy/org-agda-mode"))

;; (package! toc-mode)

;; (package! md4rd)
;; (package! org-pretty-table :recipe (:host github :repo "Fuco1/org-pretty-table"))

;; (when (package! magit :pin "2fb3bf782cc")
;;   (when (featurep! +forge)
;;     (package! forge :pin "031e4f06b2bf87f7aa113c5edcb1896127ee9d12"))
;;   (package! magit-gitflow :pin "cc41b561ec6eea947fe9a176349fb4f771ed865b")
;;   (package! magit-todos :pin "a0e5d1f3c7dfcb4f18c1b0d57f1746a4872df5c6")
;;   (package! github-review :pin "fab440aeae4fbf6a8192fd11795052e9eb5d27d1")
;;   (when (featurep! :editor evil +everywhere)
;;     (package! evil-magit :pin "88dc26ce59dbf4acb4e2891c79c4bd329553ba56")))
