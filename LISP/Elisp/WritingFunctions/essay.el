(require 'cl-lib)
(require 'subr-x)
(require 'org)

(defun essay–sanitize-tag (s)
“Return S downcased and tag-safe (spaces->-, drop punctuation).”
(let* ((down (downcase s))
(no-punct (replace-regexp-in-string “[^[:alnum:]-]” “” down))
(sp->- (replace-regexp-in-string “[[:space:]]+” “-” no-punct)))
sp->-))

(defun essay–slugify (s)
“Create a URL-ish slug from S.”
(let ((t1 (essay–sanitize-tag s)))
(replace-regexp-in-string “-+” “-” t1)))

(defun essay–read-multi (prompt &optional allow-empty)
“Read multiple lines for PROMPT; end with empty line. Returns list of strings.
If ALLOW-EMPTY is non-nil, returns empty list when first empty is given.”
(let ((items ’())
(keep t))
(while keep
(let ((ans (read-string (if items
(format “%s (Enter to finish): “ prompt)
(format “%s: “ prompt)))))
(if (string-empty-p ans)
(setq keep nil)
(push ans items))))
(setq items (nreverse items))
(if (and (not allow-empty) (null items))
(list “TBD”)
items)))

(defun essay-idea-capture ()
“Capture a non-fiction essay idea into the current Org buffer as a structured subtree.
Prompts for title, subject (used as Org tag), type, thesis, audience, angle,
key points, counterpoints, and sources. Optionally sets SCHEDULED/DEADLINE.”
(interactive)
(unless (derived-mode-p ’org-mode)
(unless (y-or-n-p “This is not an Org buffer. Insert anyway? “)
(user-error “Aborted”)))
(let* ((title (read-string “Essay Title: “))
(subject-raw (read-string “Primary Subject/Topic (used as tag, e.g., privacy, dead-internet): “))
(extra-tags (essay–read-multi “Additional tags (optional)”))
(subject (essay–sanitize-tag subject-raw))
(tags (mapconcat #'identity
(cl-remove-if #'string-empty-p
(mapcar #'essay–sanitize-tag
(cons subject extra-tags)))
“:”))
(etype (completing-read “Type: “ '(“opinion” “listicle” “explainer” “guide”) nil t nil nil “opinion”))
(wlimit (if (string= etype “opinion”) “1200” “1000”))
(audience (read-string “Audience (who is this for, in one line): “))
(thesis (read-string “Thesis (one or two sentences): “))
(angle (read-string “Unique Angle (what only you can say): “))
(keypoints (essay–read-multi “Key Point”))
(counterpoints (essay–read-multi “Counterpoint / Objection (optional)” t))
(sources (essay–read-multi “Source (paste URL or citation) (optional)” t))
(notes (read-string “Draft Notes (optional): “))
(schedule? (y-or-n-p “Add SCHEDULED timestamp? “))
(scheduled (when schedule?
(org-read-date nil nil nil “SCHEDULED for (choose date): “)))
(deadline? (y-or-n-p “Add DEADLINE timestamp? “))
(deadline (when deadline?
(org-read-date nil nil nil “DEADLINE (choose date): “)))
(slug (essay–slugify title))
(created (format-time-string “%Y-%m-%d %H:%M”)))
(save-excursion
;; Insert heading with tags
(goto-char (or (org-find-exact-headline-in-buffer “Non-Fiction Ideas”)
(progn (goto-char (point-max))
(insert “* Non-Fiction Ideas\n”)
(point))))
(org-end-of-subtree t t)
(insert (format “** %s :%s:\n” title tags))
;; Properties
(insert “:PROPERTIES:\n”)
(insert (format “:TYPE: %s\n” etype))
(insert (format “:WORDLIMIT: %s\n” wlimit))
(insert (format “:STATUS: %s\n” “IDEA”))
(insert (format “:CREATED: %s\n” created))
(insert (format “:SUBJECTS: %s\n” (mapconcat #'identity (cons subject extra-tags) “, “)))
(insert (format “:SLUG: %s\n” slug))
(insert “:END:\n”)
;; Optional timestamps
(when scheduled (insert (format “SCHEDULED: <%s>\n” scheduled)))
(when deadline (insert (format “DEADLINE: <%s>\n” deadline)))
(when (or scheduled deadline) (insert “\n”))
;; Body sections
(insert “*** Thesis\n”)
(insert (if (string-empty-p thesis) “TBD\n\n” (concat thesis “\n\n”)))
(insert “*** Audience\n”)
(insert (if (string-empty-p audience) “TBD\n\n” (concat audience “\n\n”)))
(insert “*** Unique Angle\n”)
(insert (if (string-empty-p angle) “TBD\n\n” (concat angle “\n\n”)))
(insert “*** Key Points\n”)
(dolist (kp keypoints)
(insert (format “- %s\n” kp)))
(insert “\n*** Counterpoints / Objections\n”)
(if counterpoints
(dolist (cp counterpoints)
(insert (format “- %s\n” cp)))
(insert “- (none yet)\n”))
(insert “\n*** Sources / Links\n”)
(if sources
(dolist (src sources)
(insert (format “- %s\n” src)))
(insert “- (none yet)\n”))
(insert “\n*** Draft Notes\n”)
(insert (if (string-empty-p notes) “(empty)\n\n” (concat notes “\n\n”)))
(org-cycle ’(64)) ;; show all
(message “Inserted essay idea: %s” title))))
