; Auto-generated. Do not edit!


(cl:in-package beginner_tutorials-msg)


;//! \htmlinclude StudentInfo.msg.html

(cl:defclass <StudentInfo> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (age
    :reader age
    :initarg :age
    :type cl:integer
    :initform 0)
   (gpa
    :reader gpa
    :initarg :gpa
    :type cl:float
    :initform 0.0)
   (student_id
    :reader student_id
    :initarg :student_id
    :type cl:string
    :initform ""))
)

(cl:defclass StudentInfo (<StudentInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StudentInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StudentInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name beginner_tutorials-msg:<StudentInfo> is deprecated: use beginner_tutorials-msg:StudentInfo instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <StudentInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-msg:name-val is deprecated.  Use beginner_tutorials-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'age-val :lambda-list '(m))
(cl:defmethod age-val ((m <StudentInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-msg:age-val is deprecated.  Use beginner_tutorials-msg:age instead.")
  (age m))

(cl:ensure-generic-function 'gpa-val :lambda-list '(m))
(cl:defmethod gpa-val ((m <StudentInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-msg:gpa-val is deprecated.  Use beginner_tutorials-msg:gpa instead.")
  (gpa m))

(cl:ensure-generic-function 'student_id-val :lambda-list '(m))
(cl:defmethod student_id-val ((m <StudentInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-msg:student_id-val is deprecated.  Use beginner_tutorials-msg:student_id instead.")
  (student_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StudentInfo>) ostream)
  "Serializes a message object of type '<StudentInfo>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let* ((signed (cl:slot-value msg 'age)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'gpa))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'student_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'student_id))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StudentInfo>) istream)
  "Deserializes a message object of type '<StudentInfo>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'age) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'gpa) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'student_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'student_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StudentInfo>)))
  "Returns string type for a message object of type '<StudentInfo>"
  "beginner_tutorials/StudentInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StudentInfo)))
  "Returns string type for a message object of type 'StudentInfo"
  "beginner_tutorials/StudentInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StudentInfo>)))
  "Returns md5sum for a message object of type '<StudentInfo>"
  "c051919ed71c86bd1ae31babca56f15c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StudentInfo)))
  "Returns md5sum for a message object of type 'StudentInfo"
  "c051919ed71c86bd1ae31babca56f15c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StudentInfo>)))
  "Returns full string definition for message of type '<StudentInfo>"
  (cl:format cl:nil "string name~%int32 age~%float32 gpa~%string student_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StudentInfo)))
  "Returns full string definition for message of type 'StudentInfo"
  (cl:format cl:nil "string name~%int32 age~%float32 gpa~%string student_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StudentInfo>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4
     4
     4 (cl:length (cl:slot-value msg 'student_id))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StudentInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'StudentInfo
    (cl:cons ':name (name msg))
    (cl:cons ':age (age msg))
    (cl:cons ':gpa (gpa msg))
    (cl:cons ':student_id (student_id msg))
))
