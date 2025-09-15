;;    Welcome to Emacs!
;;
;;    Loading time : 2.931122 seconds
;;    Packages     : 199
defun my-goodreads-csv-path ()
  "Return the full path to the Goodreads CSV file."
  (expand-file-name "goodReadsTheena.csv"
					
                    (concat (getenv "HOME") "/Downloads/")))
         (to-read-books '()))
    (with-temp-buffer
      (insert-file-contents csv-path)
      (goto-char (point-min))
      ;; Skip header
      (forward-line 1)
      
      ;; Iterate through lines
      (while (not (eobp))
        (let* ((line (buffer-substring-no-properties 
                      (line-beginning-position) 
                      (line-end-position)))
               ;; Split line into fields (adjust delimiter if needed)
               (fields (split-string line "," t))
               ;; Assuming 'Bookshelves' is one of the columns
               ;; You might need to adjust the index based on your CSV structure
               (bookshelves (nth 6 fields))  ; Adjust this index as needed
               (title (nth 1 fields))        ; Adjust title column index
               (author (nth 2 fields)))      ; Adjust author column index
          
          ;; Check if 'to-read' is in bookshelves
          (when (and bookshelves 
                     (string-match-p "to-read" bookshelves))
            (push (list title author) to-read-books))
          
          (forward-line 1)))

;; Create a buffer to display results
(with-output-to-temp-buffer "*Goodreads To-Read Books*"
  (princ (format "To-Read Books (%d total):\n\n" (length to-read-books)))
  (dolist (book to-read-books)
    (princ (format "- %s by %s\n" (car book) (cadr book)))))

      ;; Return the list for potential further processing
      to-read-books)))

; Optional: Add an interactive command
(defun my-count-to-read-books ()
  "Count and display the number of 'to-read' books."
  (interactive)
  (let ((to-read (my-extract-to-read-books)))
    (message "%d books are marked 'to-read'" (length to-read))))
