;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; ========== ORG-ROAM SETUP ==========
(use-package! org-roam
  :after org
  :custom
  (org-roam-directory (file-truename "~/Documents/fortress/"))
  :config
  (org-roam-db-autosync-mode)

  ;; Clear any existing templates first
  (setq org-roam-capture-templates nil)
  
  ;; Set capture templates
  (setq org-roam-capture-templates
        '(("d" "default" plain "%?"
           :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                              "#+title: ${title}\n")
           :unnarrowed t)

          ("s" "data-structures" plain "%?"
          :target (file+head "data-structures/%<%Y%m%d%H%M%S>-${slug}.org"
                            "#+title: ${title}\n#+category: data-structures\n#+tags: data-structures\n\n")
          :unnarrowed t)

          ("a" "algorithms" plain "%?"
          :target (file+head "algorithms/%<%Y%m%d%H%M%S>-${slug}.org"
                            "#+title: ${title}\n#+category: algorithms\n#+tags: algorithms\n\n")
          :unnarrowed t)

          ("e" "LeetCode Easy" plain
           "* ${title} :leetcode:easy:\n\n*Problem Description*\n\n*Approach*\n\n*Code*\n#+begin_src python\n\n#+end_src\n\n*Notes*\n"
           :target (file+head "leetcode/%<%Y%m%d%H%M%S>-${slug}.org"
                              "#+title: ${title}\n#+category: leetcode\n#+tags: leetcode easy\n")
           :unnarrowed t)

          ("m" "LeetCode Medium" plain
           "* ${title} :leetcode:medium:\n\n*Problem Description*\n\n*Approach*\n\n*Code*\n#+begin_src python\n\n#+end_src\n\n*Notes*\n"
           :target (file+head "leetcode/%<%Y%m%d%H%M%S>-${slug}.org"
                              "#+title: ${title}\n#+category: leetcode\n#+tags: leetcode medium\n")
           :unnarrowed t)

          ("h" "LeetCode Hard" plain
           "* ${title} :leetcode:hard:\n\n*Problem Description*\n\n*Approach*\n\n*Code*\n#+begin_src python\n\n#+end_src\n\n*Notes*\n"
           :target (file+head "leetcode/%<%Y%m%d%H%M%S>-${slug}.org"
                              "#+title: ${title}\n#+category: leetcode\n#+tags: leetcode hard\n")
           :unnarrowed t))))

(after! org
  ;; Make sure org-agenda includes all notes
  (setq org-agenda-files
        (delete-dups
         (directory-files-recursively "~/Documents/fortress/" "\\.org$")))

  ;; Per-tag coloring for difficulty levels
  (setq org-tag-faces
        '(("easy"   . (:background "#C8E6C9" :foreground "#2E7D32" :weight bold))
          ("medium" . (:background "#FFF9C4" :foreground "#F57F17" :weight bold))
          ("hard"   . (:background "#FFCDD2" :foreground "#C62828" :weight bold)))))

;; ========== ORG-MODERN ==========
(use-package! org-modern
  :hook (org-mode . org-modern-mode)
  :config
  (setq org-modern-tag 'inherit))

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
(setq fancy-splash-image "/home/aman/.config/doom/image(1).jpg")

