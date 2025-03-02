#!/usr/bin/env python3

import rospy
from geometry_msgs.msg import Twist
import random

def move_turtle():
    rospy.init_node('random_turtle_mover', anonymous=True)
    # Khởi tạo node cho rùa di chuyển random, nếu có nhiều node cùng tên thì tự đổi tên node này
    pub = rospy.Publisher('/turtle1/cmd_vel', Twist, queue_size=10)
    # Tạo 1 publ để gửi vận tốc đến topic
    rate = rospy.Rate(2)  # tần số chạy vòng lặp

    while not rospy.is_shutdown(): # Nếu ros bị tắt thì dừng
        twist = Twist()
        twist.linear.x = random.uniform(0.5, 2.0)  # Tốc độ tiến ngẫu nhiên
        twist.angular.z = random.uniform(-2.0, 2.0)  # Góc quay ngẫu nhiên

        rospy.loginfo(f"Linear: {twist.linear.x}, Angular: {twist.angular.z}")
        # ghi log thông tin     
        pub.publish(twist) #gửi vận tốc đến turtle

        rate.sleep() #chờ đến loop tiếp theo
# XỬ LÝ KHI BỊ DỪNG: khi chạy scipt tự gọi move_turtle() và bị dừng thì thoát ra mà k báo lỗi
if __name__ == '__main__':
    try:
        move_turtle()
    except rospy.ROSInterruptException:
        pass
