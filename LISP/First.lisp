;; This is a function named 'hello-world'.
;; Functions in Lisp are defined using 'defun'.
;; 'hello-world' takes no arguments.
(defun hello-world ()
  ;; Inside the function, we use 'format' to print a message to the console.
  ;; 't' represents the standard output (console).
  ;; "Hello, World!~%" is the message to be printed, where "~%" is a newline character.
  (format t "Hello, World!~%"))

;; Now we call the 'hello-world' function.
;; This executes the code inside the 'hello-world' function.
(hello-world)

