#!/usr/bin/env python3

import rospy
from geometry_msgs.msg import Twist
from turtlesim.msg import Pose

class AutoMoveTurtle:
    def __init__(self):
        rospy.init_node('auto_move', anonymous=True)  # Khởi tạo node ROS
        self.vel_pub = rospy.Publisher('/turtle1/cmd_vel', Twist, queue_size=10)  # Publisher gửi vận tốc
        self.pose_sub = rospy.Subscriber('/turtle1/pose', Pose, self.pose_callback)  # Subscriber nhận vị trí
        self.pose = Pose()
        self.rate = rospy.Rate(10)  # Tần số 10Hz
    
    def pose_callback(self, data):
        """Update the turtle's position when new data is received"""
        self.pose = data

    def move_turtle(self):
        """Move the turtle according to an automatic plan"""
        vel_msg = Twist()
        vel_msg.linear.x = 2.0  # Tốc độ tiến
        
        while not rospy.is_shutdown():
            # Nếu chạm tường (cách tường 0.4m trở xuống), rùa sẽ quay lại
            if self.pose.x <= 1.0 or self.pose.x >= 10.0 or self.pose.y <= 1.0 or self.pose.y >= 10.0:
                rospy.logwarn("Too close to the wall! Turning back...")  
                vel_msg.linear.x = -1.0  # Lùi lại
                vel_msg.angular.z = 0.0
                self.vel_pub.publish(vel_msg)
                rospy.sleep(1.0)

                rospy.loginfo("The turtle is turning back...")
                vel_msg.linear.x = 0.0
                vel_msg.angular.z = 2.0  # Quay
                self.vel_pub.publish(vel_msg)
                rospy.sleep(1.5)

                rospy.loginfo("Continue moving...")
                vel_msg.angular.z = 0.0
                vel_msg.linear.x = 2.0  # Tiếp tục tiến
                self.vel_pub.publish(vel_msg)

            self.vel_pub.publish(vel_msg)
            self.rate.sleep()

if __name__ == '__main__':
    try:
        turtle = AutoMoveTurtle()
        turtle.move_turtle()
    except rospy.ROSInterruptException:
        pass
