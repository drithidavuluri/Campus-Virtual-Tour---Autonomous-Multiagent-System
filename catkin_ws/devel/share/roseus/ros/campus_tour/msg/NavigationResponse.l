;; Auto-generated. Do not edit!


(when (boundp 'campus_tour::NavigationResponse)
  (if (not (find-package "CAMPUS_TOUR"))
    (make-package "CAMPUS_TOUR"))
  (shadow 'NavigationResponse (find-package "CAMPUS_TOUR")))
(unless (find-package "CAMPUS_TOUR::NAVIGATIONRESPONSE")
  (make-package "CAMPUS_TOUR::NAVIGATIONRESPONSE"))

(in-package "ROS")
;;//! \htmlinclude NavigationResponse.msg.html


(defclass campus_tour::NavigationResponse
  :super ros::object
  :slots (_success _path _denial_reason ))

(defmethod campus_tour::NavigationResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:path __path) "")
    ((:denial_reason __denial_reason) "")
    )
   (send-super :init)
   (setq _success __success)
   (setq _path (string __path))
   (setq _denial_reason (string __denial_reason))
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:path
   (&optional __path)
   (if __path (setq _path __path)) _path)
  (:denial_reason
   (&optional __denial_reason)
   (if __denial_reason (setq _denial_reason __denial_reason)) _denial_reason)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _path
    4 (length _path)
    ;; string _denial_reason
    4 (length _denial_reason)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _path
       (write-long (length _path) s) (princ _path s)
     ;; string _denial_reason
       (write-long (length _denial_reason) s) (princ _denial_reason s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _path
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _path (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _denial_reason
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _denial_reason (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get campus_tour::NavigationResponse :md5sum-) "63bc79389dc77a49a67022340f72da88")
(setf (get campus_tour::NavigationResponse :datatype-) "campus_tour/NavigationResponse")
(setf (get campus_tour::NavigationResponse :definition-)
      "bool success
string path
string denial_reason

")



(provide :campus_tour/NavigationResponse "63bc79389dc77a49a67022340f72da88")


