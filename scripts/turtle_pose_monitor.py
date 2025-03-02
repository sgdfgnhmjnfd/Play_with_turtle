#!/usr/bin/env python3

import rospy
from turtlesim.msg import Pose

# Kích thước cửa sổ turtlesim (chuẩn là 11x11)
WALL_LIMIT = 11.0
SAFE_DISTANCE = 0.4  # Báo WARNING khi còn cách tường 0.3m - 0.4m
DANGER_DISTANCE = 0.3  # Báo ERROR khi còn cách tường dưới 0.3m

def pose_callback(pose):
    x, y = pose.x, pose.y

    # Tính khoảng cách đến các bức tường
    dist_left   = x
    dist_right  = WALL_LIMIT - x
    dist_bottom = y
    dist_top    = WALL_LIMIT - y

    # Lấy khoảng cách ngắn nhất đến tường
    min_dist = min(dist_left, dist_right, dist_bottom, dist_top)

    # Hiển thị vị trí rùa
    rospy.loginfo(f"Rùa ở vị trí (x={x:.2f}, y={y:.2f})")

    # Kiểm tra cảnh báo
    if DANGER_DISTANCE <= min_dist <= SAFE_DISTANCE:
        rospy.logwarn("⚠️ The turtle is approaching the wall!!")
    elif min_dist < DANGER_DISTANCE:
        rospy.logerr("🚨 Too close to the wall! Collision risk!!")

def listener():
    rospy.init_node('turtle_pose_monitor', anonymous=True)
    rospy.Subscriber('/turtle1/pose', Pose, pose_callback)
    rospy.spin()

if __name__ == '__main__':
    listener()
