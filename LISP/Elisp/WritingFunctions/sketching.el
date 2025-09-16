;;; Fiction Writing: Character Sketcher


;;;INTRODUCTION
;; The following functions are both for self-study, experimentation and perhaps including in the intial ideation phases of writing

;; These are simple functions with simple goals and designed to enhance the sketching process when i am sketching initial ideas for a story. Use sparingly.   

;;; IMPORTANT NOTE
;; Most of the following functions DO NOT store any data, so it will not persist across sessions


;;; FUNCTION 1:

;; Add characters, traits and values. This function temporarily stores the values entered by user in memory but WILL NOT persist across sessions. You can add characters and view characters stored in memory during a session.

;; The following was done by AI. I have remixed it below. 


(defvar my-characters nil "List of character profiles.")

(defun add-character (name goal value)
  "Add a character NAME with TRAIT and VALUE to `my-characters`."
  (interactive "sCharacter name: \nsGoal: \nsValue: ")
  (let ((character `((name . ,name) (,goal . ,value))))
    (push character my-characters)
    (message "Added character: %s (%s: %s)" name goal value)))

(defun view-characters ()
  "Display all character profiles in a temporary buffer."
  (interactive)
  (with-output-to-temp-buffer "*Character Profiles*"
    (dolist (character my-characters)
      (princ (format "Name: %s\n" (cdr (assoc 'name character))))
      (dolist (pair character)
        (unless (eq (car pair) 'name)
          (princ (format "  %s: %s\n" (car pair) (cdr pair)))))
      (princ "\n"))))


;;; THEENA FUNCTION 1 REMIXED
;; Here I have just changed variables around to create a new function called my protagonists. Nothing special, but a small step in becoming comfortable enough to tinker with elisp  

(defvar my-proto nil "List of character profiles.")

(defun add-proto (proto goal value)
  "Add a character NAME with TRAIT and VALUE to `my-characters`."
  (interactive "sProto name: \nsGoal: \nsValue: ")
  (let ((character `((proto . ,proto) (,goal . ,value))))
    (push character my-proto)
    (message "Added proto: %s (%s: %s)" proto goal value)))

(defun view-proto ()
  "Display all character profiles in a temporary buffer."
  (interactive)
  (with-output-to-temp-buffer "*Proto Profiles*"
    (dolist (proto my-proto)
      (princ (format "Name: %s\n" (cdr (assoc 'proto proto))))
      (dolist (pair proto)
        (unless (eq (car pair) 'name)
          (princ (format "  %s: %s\n" (car pair) (cdr pair)))))
      (princ "\n"))


;;; FUNCTION 2:

;; A more immediately useful function that enters a basic character template into the buffer from  current cursor position. 

;; Insert a character template at the current cursor position
(defun insert-character-template ()
  "Insert a simple character template for fiction writing."
  (interactive)
  (insert
   "* Character\n"
   "- Name: \n"
   "- Age: \n"
   "- Role: \n"
   "- Motivation: \n"
   "- Conflict: \n"
   "- Description: \n"))


;; Fiction Sketcher: Logline, Summary, and Character Profiles

(defvar fiction-sketch-logline nil "Stores the logline (max 160 chars).")
(defvar fiction-sketch-summary nil "Stores the summary (max 500 chars).")
(defvar fiction-sketch-characters nil "List of character psychological profiles.")

(defun fiction-sketch-create ()
  "Guide through the initial fiction sketching process."
  (interactive)
  ;; Step 1: Logline
  (setq fiction-sketch-logline
        (read-string "Logline (max 160 chars): "))
  (when (> (length fiction-sketch-logline) 160)
    (setq fiction-sketch-logline (substring fiction-sketch-logline 0 160))
    (message "Logline truncated to 160 characters."))

  ;; Step 2: Summary
  (setq fiction-sketch-summary
        (read-string "Summary (max 500 chars): "))
  (when (> (length fiction-sketch-summary) 500)
    (setq fiction-sketch-summary (substring fiction-sketch-summary 0 500))
    (message "Summary truncated to 500 characters."))

  ;; Step 3: Character Profiles
  (setq fiction-sketch-characters nil)
  (let ((add-more t))
    (while add-more
      (let* ((name (read-string "Character name: "))
             (self-esteem (read-number "Self-esteem (1-5): "))
             (social-reputation (read-number "Social reputation (1-5): "))
             (profile `((name . ,name)
                        (self-esteem . ,self-esteem)
                        (social-reputation . ,social-reputation))))
        (push profile fiction-sketch-characters)
        (setq add-more
              (y-or-n-p "Add another character? ")))))

  ;; Display results
  (with-output-to-temp-buffer "*Fiction Sketch*"
    (princ (format "Logline: %s\n\n" fiction-sketch-logline))
    (princ (format "Summary: %s\n\n" fiction-sketch-summary))
    (princ "Character Profiles:\n")
    (dolist (char fiction-sketch-characters)
      (princ (format "  Name: %s\n    Self-esteem: %d\n    Social reputation: %d\n\n"
                     (cdr (assoc 'name char))
                     (cdr (assoc 'self-esteem char))
                     (cdr (assoc 'social-reputation char)))))))

