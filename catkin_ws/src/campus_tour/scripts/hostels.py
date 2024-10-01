#!/usr/bin/env python3
import rospy
from visualization_msgs.msg import Marker
from geometry_msgs.msg import Point
from std_msgs.msg import ColorRGBA

def create_hostel_marker(id, points, color, scale, text=""):
    marker = Marker()
    marker.header.frame_id = "map"
    marker.header.stamp = rospy.Time.now()
    marker.ns = "hostel_map"
    marker.id = id
    marker.type = Marker.CUBE_LIST
    marker.action = Marker.ADD
    marker.scale = scale
    marker.color = color
    marker.points = points

    if text:
        text_marker = Marker()
        text_marker.header = marker.header
        text_marker.ns = "hostel_labels"
        text_marker.id = id + 1000
        text_marker.type = Marker.TEXT_VIEW_FACING
        text_marker.action = Marker.ADD
        text_marker.scale.z = 2.0
        text_marker.color = ColorRGBA(1.0, 1.0, 1.0, 1.0)
        text_marker.text = text
        text_marker.pose.position = Point(sum(p.x for p in points) / len(points),
                                          sum(p.y for p in points) / len(points),
                                          scale.z + 1)
        return [marker, text_marker]
    return [marker]

def main():
    rospy.init_node('hostel_map_node')
    pub = rospy.Publisher('/hostel_map_visualization', Marker, queue_size=10)
    rate = rospy.Rate(1)

    markers = []

    # Define colors
    ORANGE = ColorRGBA(1.0, 0.65, 0.0, 1.0)

    # Hostel Building Structure
    hostel_points = [Point(x, y, 0) for x in range(60, 100, 20) for y in range(10, 50, 20)]
    for i, point in enumerate(hostel_points):
        markers.extend(create_hostel_marker(4 + i, [point], ORANGE, Point(15.0, 15.0, 15.0), f"Hostel {i+1}"))

    while not rospy.is_shutdown():
        for marker in markers:
            marker.header.stamp = rospy.Time.now()
            pub.publish(marker)
            rate.sleep()

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass
