;; Ask the user for their name and store it in the *name* variable
(print "What is your name?")  ;; Display "What is your name?" on the console
(defvar *name* (read))  ;; Read the user input and store it in the *name* variable
;; defvar is how you define a global variable in Lisp

(defun hello-you (name)
  ;; Print a greeting message using the provided name
  (format t "Hello ~a! ~%" name))  ;; Display "Hello [name]!" on the console

;; Set the print case configuration to capitalize printed strings
(setq *print-case* :CAPITALIZE)  ;; Set print output to capitalize mode

;; Call the hello-you function to greet the user with their entered name
(hello-you *name*)  ;; Display a greeting message using the stored *name* variable
