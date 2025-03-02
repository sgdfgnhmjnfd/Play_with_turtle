;; Auto-generated. Do not edit!


(when (boundp 'beginner_tutorials::StudentInfo)
  (if (not (find-package "BEGINNER_TUTORIALS"))
    (make-package "BEGINNER_TUTORIALS"))
  (shadow 'StudentInfo (find-package "BEGINNER_TUTORIALS")))
(unless (find-package "BEGINNER_TUTORIALS::STUDENTINFO")
  (make-package "BEGINNER_TUTORIALS::STUDENTINFO"))

(in-package "ROS")
;;//! \htmlinclude StudentInfo.msg.html


(defclass beginner_tutorials::StudentInfo
  :super ros::object
  :slots (_name _age _gpa _student_id ))

(defmethod beginner_tutorials::StudentInfo
  (:init
   (&key
    ((:name __name) "")
    ((:age __age) 0)
    ((:gpa __gpa) 0.0)
    ((:student_id __student_id) "")
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _age (round __age))
   (setq _gpa (float __gpa))
   (setq _student_id (string __student_id))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:age
   (&optional __age)
   (if __age (setq _age __age)) _age)
  (:gpa
   (&optional __gpa)
   (if __gpa (setq _gpa __gpa)) _gpa)
  (:student_id
   (&optional __student_id)
   (if __student_id (setq _student_id __student_id)) _student_id)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; int32 _age
    4
    ;; float32 _gpa
    4
    ;; string _student_id
    4 (length _student_id)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; int32 _age
       (write-long _age s)
     ;; float32 _gpa
       (sys::poke _gpa (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _student_id
       (write-long (length _student_id) s) (princ _student_id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _age
     (setq _age (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _gpa
     (setq _gpa (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _student_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _student_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get beginner_tutorials::StudentInfo :md5sum-) "c051919ed71c86bd1ae31babca56f15c")
(setf (get beginner_tutorials::StudentInfo :datatype-) "beginner_tutorials/StudentInfo")
(setf (get beginner_tutorials::StudentInfo :definition-)
      "string name
int32 age
float32 gpa
string student_id

")



(provide :beginner_tutorials/StudentInfo "c051919ed71c86bd1ae31babca56f15c")


