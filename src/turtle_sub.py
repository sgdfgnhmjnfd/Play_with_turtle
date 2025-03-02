#!/usr/bin/env python3

import rospy
from geometry_msgs.msg import Twist
import random

def gen_value():
    beacon = Twist()
    beacon.linear.x = random.uniform(-2, 2)  # Sử dụng uniform cho số thực
    beacon.linear.y = random.uniform(-2, 2)
    beacon.angular.z = random.uniform(-3.14, 3.14)
    return beacon

if __name__ == "__main__":
    rospy.init_node('control_turtle')  # Khởi tạo node ROS
    pub = rospy.Publisher('/turtle1/cmd_vel', Twist, queue_size=10)  # Tạo publisher

    rate = rospy.Rate(1)  # Tốc độ gửi lệnh: 1 Hz (1 lần/s)

    while not rospy.is_shutdown():
        cmd = gen_value()  # Lấy giá trị điều khiển ngẫu nhiên
        rospy.loginfo(f"Sending command: Linear({cmd.linear.x}, {cmd.linear.y}), Angular({cmd.angular.z})")
        pub.publish(cmd)  # Gửi lệnh
        rate.sleep()  # Chờ để lặp lại
