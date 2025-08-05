;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; ========== ORG-ROAM SETUP ==========
(use-package! org-roam
  :after org
  :custom
  (org-roam-directory (file-truename "~/Documents/fortress/"))
  :config
  (org-roam-db-autosync-mode)

  (setq org-roam-capture-templates nil)
  
  (setq org-roam-capture-templates
        '(("d" "default" plain "%?"
           :target (file+head "${slug}.org"
                              "#+title: ${title}\n")
           :unnarrowed t)

          ("s" "data-structures" plain "%?"
          :target (file+head "data-structures/${slug}.org"
                            "#+title: ${title}\n#+category: data-structures\n#+tags: data-structures\n\n")
          :unnarrowed t)

          ("a" "algorithms" plain "%?"
          :target (file+head "algorithms/${slug}.org"
                            "#+title: ${title}\n#+category: algorithms\n#+tags: algorithms\n\n")
          :unnarrowed t)

          ("h" "LeetCode Hard" plain
          "*Link*\n[[]]\n\n*Problem Description*\n\n*Approach*\n\n*Code*\n#+begin_src python\n\n#+end_src\n\n*Notes*\n"
          :target (file+head "leetcode/${slug}.org"
                             "#+title: ${title}\n#+category: leetcode\n#+tags: leetcode hard\n")
          :unnarrowed t)
        
          ("m" "LeetCode Medium" plain
          "*Link*\n[[]]\n\n*Problem Description*\n\n*Approach*\n\n*Code*\n#+begin_src python\n\n#+end_src\n\n*Notes*\n"
          :target (file+head "leetcode/${slug}.org"
                             "#+title: ${title}\n#+category: leetcode\n#+tags: leetcode medium\n")
          :unnarrowed t)
        
          ("e" "LeetCode Easy" plain
          "*Link*\n[[]]\n\n*Problem Description*\n\n*Approach*\n\n*Code*\n#+begin_src python\n\n#+end_src\n\n*Notes*\n"
          :target (file+head "leetcode/${slug}.org"
                             "#+title: ${title}\n#+category: leetcode\n#+tags: leetcode easy\n")
          :unnarrowed t))))

(after! org
  (setq org-agenda-files
        (delete-dups
         (directory-files-recursively "~/Documents/fortress/" "\\.org$")))

  (setq org-tag-faces
        '(("easy"   . (:background "#C8E6C9" :foreground "#2E7D32" :weight bold))
          ("medium" . (:background "#FFF9C4" :foreground "#F57F17" :weight bold))
          ("hard"   . (:background "#FFCDD2" :foreground "#C62828" :weight bold)))))

;; ========== ORG-MODERN ==========
(use-package! org-modern
  :hook (org-mode . org-modern-mode)
  :config
  (setq org-modern-tag 'inherit))

(use-package! websocket
    :after org-roam)

;; ========== ORG-ROAM-UI ==========
(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))


;; ========== ORG-ROAM KEYBINDINGS ==========
(map! :leader
      :prefix ("n" . "notes")
      :desc "Find/Create node"     "f" #'org-roam-node-find
      :desc "Insert node"          "i" #'org-roam-node-insert
      :desc "Toggle roam buffer"   "b" #'org-roam-buffer-toggle
      :desc "Capture to roam"      "c" #'org-roam-capture
      :desc "Sync roam DB"         "s" #'org-roam-db-sync
      :desc "Goto daily note"      "d" #'org-roam-dailies-goto-today
      :desc "Capture daily note"   "D" #'org-roam-dailies-capture-today)

;; ========== OPTIONAL: HTML PREVIEW ==========
(use-package! org-preview-html
  :ensure t)

;; ========== UI / THEME / PERSONAL ==========
(setq doom-theme 'doom-gruvbox)
(setq display-line-numbers-type t)
(setq org-directory "~/org/")
(setq fancy-splash-image "/Users/aip/.config/doom/image(1).jpg")

