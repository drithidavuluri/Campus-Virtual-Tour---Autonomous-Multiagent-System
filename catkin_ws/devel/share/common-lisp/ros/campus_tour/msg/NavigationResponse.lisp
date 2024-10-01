; Auto-generated. Do not edit!


(cl:in-package campus_tour-msg)


;//! \htmlinclude NavigationResponse.msg.html

(cl:defclass <NavigationResponse> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (path
    :reader path
    :initarg :path
    :type cl:string
    :initform "")
   (denial_reason
    :reader denial_reason
    :initarg :denial_reason
    :type cl:string
    :initform ""))
)

(cl:defclass NavigationResponse (<NavigationResponse>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <NavigationResponse>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'NavigationResponse)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name campus_tour-msg:<NavigationResponse> is deprecated: use campus_tour-msg:NavigationResponse instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <NavigationResponse>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader campus_tour-msg:success-val is deprecated.  Use campus_tour-msg:success instead.")
  (success m))

(cl:ensure-generic-function 'path-val :lambda-list '(m))
(cl:defmethod path-val ((m <NavigationResponse>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader campus_tour-msg:path-val is deprecated.  Use campus_tour-msg:path instead.")
  (path m))

(cl:ensure-generic-function 'denial_reason-val :lambda-list '(m))
(cl:defmethod denial_reason-val ((m <NavigationResponse>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader campus_tour-msg:denial_reason-val is deprecated.  Use campus_tour-msg:denial_reason instead.")
  (denial_reason m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <NavigationResponse>) ostream)
  "Serializes a message object of type '<NavigationResponse>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'path))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'path))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'denial_reason))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'denial_reason))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <NavigationResponse>) istream)
  "Deserializes a message object of type '<NavigationResponse>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'path) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'path) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'denial_reason) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'denial_reason) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<NavigationResponse>)))
  "Returns string type for a message object of type '<NavigationResponse>"
  "campus_tour/NavigationResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NavigationResponse)))
  "Returns string type for a message object of type 'NavigationResponse"
  "campus_tour/NavigationResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<NavigationResponse>)))
  "Returns md5sum for a message object of type '<NavigationResponse>"
  "63bc79389dc77a49a67022340f72da88")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'NavigationResponse)))
  "Returns md5sum for a message object of type 'NavigationResponse"
  "63bc79389dc77a49a67022340f72da88")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<NavigationResponse>)))
  "Returns full string definition for message of type '<NavigationResponse>"
  (cl:format cl:nil "bool success~%string path~%string denial_reason~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'NavigationResponse)))
  "Returns full string definition for message of type 'NavigationResponse"
  (cl:format cl:nil "bool success~%string path~%string denial_reason~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <NavigationResponse>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'path))
     4 (cl:length (cl:slot-value msg 'denial_reason))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <NavigationResponse>))
  "Converts a ROS message object to a list"
  (cl:list 'NavigationResponse
    (cl:cons ':success (success msg))
    (cl:cons ':path (path msg))
    (cl:cons ':denial_reason (denial_reason msg))
))
