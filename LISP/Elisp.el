*** Welcome to IELM ***  Type (describe-mode) or press C-h m for help.
ELISP> (+ 2 3)
5 (#o5, #x5, ?\C-e)
ELISP> (setq my-variable 42)
42 (#o52, #x2a, ?*)
ELISP> (message "The answer is %d" my-variable)
"The answer is 42"
ELISP> (defun my-function (arg1 arg2)
		 "docstring explaining the function"
		 (+ arg1 arg2))
my-function
ELISP>  ( + 2 2)	 
4 (#o4, #x4, ?\C-d)
ELISP> ( + 2 ( + 11))
13 (#o15, #xd, ?\C-m)
ELISP>  bl