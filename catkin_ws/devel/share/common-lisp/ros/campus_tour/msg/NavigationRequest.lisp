; Auto-generated. Do not edit!


(cl:in-package campus_tour-msg)


;//! \htmlinclude NavigationRequest.msg.html

(cl:defclass <NavigationRequest> (roslisp-msg-protocol:ros-message)
  ((visitor_id
    :reader visitor_id
    :initarg :visitor_id
    :type cl:string
    :initform "")
   (building_id
    :reader building_id
    :initarg :building_id
    :type cl:string
    :initform ""))
)

(cl:defclass NavigationRequest (<NavigationRequest>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <NavigationRequest>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'NavigationRequest)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name campus_tour-msg:<NavigationRequest> is deprecated: use campus_tour-msg:NavigationRequest instead.")))

(cl:ensure-generic-function 'visitor_id-val :lambda-list '(m))
(cl:defmethod visitor_id-val ((m <NavigationRequest>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader campus_tour-msg:visitor_id-val is deprecated.  Use campus_tour-msg:visitor_id instead.")
  (visitor_id m))

(cl:ensure-generic-function 'building_id-val :lambda-list '(m))
(cl:defmethod building_id-val ((m <NavigationRequest>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader campus_tour-msg:building_id-val is deprecated.  Use campus_tour-msg:building_id instead.")
  (building_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <NavigationRequest>) ostream)
  "Serializes a message object of type '<NavigationRequest>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'visitor_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'visitor_id))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'building_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'building_id))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <NavigationRequest>) istream)
  "Deserializes a message object of type '<NavigationRequest>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'visitor_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'visitor_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'building_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'building_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<NavigationRequest>)))
  "Returns string type for a message object of type '<NavigationRequest>"
  "campus_tour/NavigationRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NavigationRequest)))
  "Returns string type for a message object of type 'NavigationRequest"
  "campus_tour/NavigationRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<NavigationRequest>)))
  "Returns md5sum for a message object of type '<NavigationRequest>"
  "2fa5e4010f01de8a50c1eaada5e59e13")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'NavigationRequest)))
  "Returns md5sum for a message object of type 'NavigationRequest"
  "2fa5e4010f01de8a50c1eaada5e59e13")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<NavigationRequest>)))
  "Returns full string definition for message of type '<NavigationRequest>"
  (cl:format cl:nil "string visitor_id~%string building_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'NavigationRequest)))
  "Returns full string definition for message of type 'NavigationRequest"
  (cl:format cl:nil "string visitor_id~%string building_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <NavigationRequest>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'visitor_id))
     4 (cl:length (cl:slot-value msg 'building_id))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <NavigationRequest>))
  "Converts a ROS message object to a list"
  (cl:list 'NavigationRequest
    (cl:cons ':visitor_id (visitor_id msg))
    (cl:cons ':building_id (building_id msg))
))
