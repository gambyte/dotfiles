(in-package :stumpwm)

(load "~/quicklisp/setup.lisp")

(ql:quickload :swank)

(let ((server-running nil)
      (first-time t))
  (defcommand start-swank () ()
    "Toggle the swank server on/off. Ensure quicklisp is loaded
first."
    (eval-when (:execute)
      (ql:quickload :swank))
    (if server-running
        (progn
          (swank:stop-server 4005)
          (echo-string
           (current-screen)
           "Stopping swank.")
          (setf server-running nil))
        (progn
	  (swank:create-server :port 4005
	    :style swank:*communication-style*
	    :dont-close t)
	  (if first-time
	      (setf first-time nil)
	      (echo-string
	       (current-screen)
	       "Re-starting swank."))
          (setf server-running t)))))

(start-swank)
