;; Auto-generated. Do not edit!


(when (boundp 'campus_tour::NavigationRequest)
  (if (not (find-package "CAMPUS_TOUR"))
    (make-package "CAMPUS_TOUR"))
  (shadow 'NavigationRequest (find-package "CAMPUS_TOUR")))
(unless (find-package "CAMPUS_TOUR::NAVIGATIONREQUEST")
  (make-package "CAMPUS_TOUR::NAVIGATIONREQUEST"))

(in-package "ROS")
;;//! \htmlinclude NavigationRequest.msg.html


(defclass campus_tour::NavigationRequest
  :super ros::object
  :slots (_visitor_id _building_id ))

(defmethod campus_tour::NavigationRequest
  (:init
   (&key
    ((:visitor_id __visitor_id) "")
    ((:building_id __building_id) "")
    )
   (send-super :init)
   (setq _visitor_id (string __visitor_id))
   (setq _building_id (string __building_id))
   self)
  (:visitor_id
   (&optional __visitor_id)
   (if __visitor_id (setq _visitor_id __visitor_id)) _visitor_id)
  (:building_id
   (&optional __building_id)
   (if __building_id (setq _building_id __building_id)) _building_id)
  (:serialization-length
   ()
   (+
    ;; string _visitor_id
    4 (length _visitor_id)
    ;; string _building_id
    4 (length _building_id)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _visitor_id
       (write-long (length _visitor_id) s) (princ _visitor_id s)
     ;; string _building_id
       (write-long (length _building_id) s) (princ _building_id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _visitor_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _visitor_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _building_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _building_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get campus_tour::NavigationRequest :md5sum-) "2fa5e4010f01de8a50c1eaada5e59e13")
(setf (get campus_tour::NavigationRequest :datatype-) "campus_tour/NavigationRequest")
(setf (get campus_tour::NavigationRequest :definition-)
      "string visitor_id
string building_id

")



(provide :campus_tour/NavigationRequest "2fa5e4010f01de8a50c1eaada5e59e13")


