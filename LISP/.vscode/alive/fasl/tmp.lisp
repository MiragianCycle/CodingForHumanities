(defun hello-world ()
  (format t "Hello, World!"))
(hello-world)

(defun tell-knight-story ()
  (let ((knight-name "Sir Lancelot")
        (quest "Holy Grail")
        (obstacle "fierce dragon"))
    (format t "Once upon a time, there was a brave knight named ~A.~%" knight-name)
    (format t "~A embarked on a quest to find the ~A.~%" knight-name quest)
    (format t "On his journey, he encountered a ~A.~%" obstacle)
    (format t "With courage and skill, ~A defeated the ~A.~%" knight-name obstacle)
    (format t "Finally, ~A found the ~A and returned home victorious.~%" knight-name quest)))

(tell-knight-story)

(defun tell-romeo-and-juliet ()
  (let ((romeo "Romeo")
        (juliet "Juliet")
        (capulet "Capulet")
        (montague "Montague")
        (friar "Friar Lawrence")
        (prince "Prince Escalus"))

    (defun narrate (text &rest args)
      (apply #'format t (cons text args))
      (format t "~%"))
    
    (defun character-action (character action)
      (narrate "~A ~A." character action))
    
    (narrate "In fair Verona, where we lay our scene...")
    (narrate "Two households, both alike in dignity: ~A and ~A." montague capulet)
    
    (character-action romeo "attends a Capulet feast in disguise")
    (character-action juliet "catches Romeo's eye")
    (narrate "~A and ~A fall in love at first sight." romeo juliet)
    
    (narrate "But their families are sworn enemies.")
    (character-action (format nil "~A and ~A" romeo juliet) "meet in secret and decide to marry")
    (character-action friar "agrees to perform the ceremony")
    
    (narrate "Tragedy strikes: ~A's cousin is killed in a duel." juliet)
    (character-action romeo "avenges the death, killing ~A's kinsman" juliet)
    (character-action prince "banishes ~A from Verona" romeo)
    
    (narrate "~A's parents arrange her marriage to another man." juliet)
    (character-action friar "devises a plan to reunite the lovers")
    (character-action juliet "takes a potion to appear dead")
    
    (narrate "The plan goes awry...")
    (character-action romeo "believes ~A is truly dead" juliet)
    (character-action romeo "takes poison and dies by ~A's side" juliet)
    (character-action juliet "wakes to find ~A dead, and takes her own life" romeo)
    
    (narrate "The feuding families, faced with the tragic consequences of their enmity, finally reconcile.")
    (narrate "Thus concludes the woeful tale of ~A and ~A." romeo juliet)))

(tell-romeo-and-juliet)

(defun tell-paradise-lost ()
  (let ((god "God")
        (satan "Satan")
        (adam "Adam")
        (eve "Eve")
        (son "Son of God")
        (raphael "Raphael")
        (michael "Michael"))

    (defun narrate (text &rest args)
      (apply #'format t (cons text args))
      (format t "~%"))
    
    (defun character-action (character action)
      (narrate "~A ~A." character action))
    
    (narrate "Of Man's First Disobedience, and the Fruit...")
    (narrate "Of that Forbidden Tree, whose mortal taste...")
    (narrate "Brought Death into the World, and all our woe...")
    
    (character-action satan "rebels against God")
    (character-action god "casts Satan and his followers out of Heaven")
    
    (narrate "~A and his legions fall for nine days..." satan)
    (character-action satan "lands in Hell")
    
    (narrate "Meanwhile, ~A creates the Earth and ~A and ~A" god adam eve)
    (character-action god "places them in the Garden of Eden")
    
    (character-action satan "learns of the new creation")
    (character-action satan "journeys to Earth")
    
    (narrate "~A sends ~A to warn ~A and ~A about ~A" god raphael adam eve satan)
    (character-action raphael "tells the story of the War in Heaven")
    
    (character-action satan "takes the form of a serpent")
    (character-action satan "tempts Eve to eat from the Tree of Knowledge")
    (character-action eve "eats the forbidden fruit")
    (character-action adam "chooses to eat as well, to stay with Eve")
    
    (narrate "Sin and Death enter the world")
    (character-action god "sends the Son to judge Adam and Eve")
    
    (narrate "~A intercedes on behalf of humanity" son)
    (character-action god "accepts the Son's offer to eventually redeem mankind")
    
    (character-action michael "shows Adam visions of the future")
    (narrate "Adam learns of the eventual coming of the Messiah")
    
    (character-action (format nil "~A and ~A" adam eve) "are cast out of Eden")
    (narrate "They walk hand in hand into the world, with Providence their guide.")
    
    (narrate "Thus concludes Milton's epic tale of Paradise Lost.")))

(tell-paradise-lost)
