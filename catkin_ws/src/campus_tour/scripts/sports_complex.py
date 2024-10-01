#!/usr/bin/env python3
import rospy
from visualization_msgs.msg import Marker
from geometry_msgs.msg import Point
from std_msgs.msg import ColorRGBA

def create_sports_complex_marker(id, points, color, scale, text=""):
    marker = Marker()
    marker.header.frame_id = "map"
    marker.header.stamp = rospy.Time.now()
    marker.ns = "sports_complex_map"
    marker.id = id
    marker.type = Marker.CUBE_LIST
    marker.action = Marker.ADD
    marker.scale = scale
    marker.color = color
    marker.points = points

    if text:
        text_marker = Marker()
        text_marker.header = marker.header
        text_marker.ns = "sports_complex_labels"
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
    rospy.init_node('sports_complex_map_node')
    pub = rospy.Publisher('/sports_complex_map_visualization', Marker, queue_size=10)
    rate = rospy.Rate(1)

    markers = []

    # Define colors
    PURPLE = ColorRGBA(0.5, 0.0, 0.5, 1.0)

    # Sports Complex Building Structure
    sports_points = [Point(80, 60, 0)]
    markers.extend(create_sports_complex_marker(1, sports_points, PURPLE, Point(30.0, 20.0, 5.0), "Sports Complex"))

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
