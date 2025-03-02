#!/usr/bin/env python3
import rospy  # Thư viện ROS để tạo node
from geometry_msgs.msg import Twist  # Import message Twist để điều khiển robot
from pynput import keyboard  # Thư viện để nhận input từ bàn phím

class KeyboardController:
    def __init__(self):
        rospy.init_node('keyboard_control', anonymous=True)  # Khởi tạo node ROS
        self.pub = rospy.Publisher('/turtle1/cmd_vel', Twist, queue_size=10)  # Tạo publisher gửi dữ liệu điều khiển đến topic
        self.speed = 0.5  # Thiết lập tốc độ di chuyển cơ bản
        self.angular_speed = 1.0  # Thiết lập tốc độ quay
        self.twist = Twist()  # Tạo một đối tượng Twist để chứa dữ liệu vận tốc
        self.accumulate_speed = False  # Biến để kiểm soát tốc độ tích lũy hay không
        self.running = True  # Kiểm soát vòng lặp chính của chương trình

    def on_press(self, key):
        try:
            if key.char == 'w':  # Nhấn 'w' để tiến về phía trước
                self.twist.linear.x += self.speed if self.accumulate_speed else self.speed
            elif key.char == 's':  # Nhấn 's' để lùi lại
                self.twist.linear.x -= self.speed if self.accumulate_speed else self.speed
            elif key.char == 'a':  # Nhấn 'a' để quay trái
                self.twist.angular.z += self.angular_speed if self.accumulate_speed else self.angular_speed
            elif key.char == 'd':  # Nhấn 'd' để quay phải
                self.twist.angular.z -= self.angular_speed if self.accumulate_speed else self.angular_speed
            elif key.char == 'x':  # Nhấn 'x' để dừng ngay lập tức
                self.twist.linear.x = 0
                self.twist.angular.z = 0
            elif key.char == 'q':  # Nhấn 'q' để thoát chương trình
                self.running = False
                return False  # Dừng lắng nghe bàn phím
            self.pub.publish(self.twist)  # Gửi dữ liệu vận tốc đến topic
        except AttributeError:
            pass  # Bỏ qua lỗi nếu nhấn phím không phải ký tự chữ

    def on_release(self, key):
        if not self.accumulate_speed:  # Nếu không dùng chế độ tốc độ tích lũy, thì dừng ngay khi nhả phím
            self.twist.linear.x = 0
            self.twist.angular.z = 0
            self.pub.publish(self.twist)  # Gửi lệnh dừng lại

    def run(self):
        with keyboard.Listener(on_press=self.on_press, on_release=self.on_release) as listener:
            rospy.spin()  # Giữ chương trình chạy
            listener.join()  # Duy trì lắng nghe phím bấm

if __name__ == '__main__':
    try:
        controller = KeyboardController()
        controller.run()
    except rospy.ROSInterruptException:
        pass  # Xử lý ngoại lệ nếu ROS bị gián đoạn
