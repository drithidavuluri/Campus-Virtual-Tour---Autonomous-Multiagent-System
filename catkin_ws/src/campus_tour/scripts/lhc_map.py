#!/usr/bin/env python3
import rospy
from visualization_msgs.msg import Marker
from geometry_msgs.msg import Point
from std_msgs.msg import ColorRGBA

def create_lhc_marker(id, points, color, scale, text=""):
    marker = Marker()
    marker.header.frame_id = "map"
    marker.header.stamp = rospy.Time.now()
    marker.ns = "lhc_map"
    marker.id = id
    marker.type = Marker.CUBE_LIST
    marker.action = Marker.ADD
    marker.scale = scale
    marker.color = color
    marker.points = points

    if text:
        text_marker = Marker()
        text_marker.header = marker.header
        text_marker.ns = "lhc_labels"
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
    rospy.init_node('lhc_map_node')
    pub = rospy.Publisher('/lhc_map_visualization', Marker, queue_size=10)
    rate = rospy.Rate(1)

    markers = []

    # Define colors
    YELLOW = ColorRGBA(1.0, 1.0, 0.0, 1.0)

    # LHC Building Structure
    lhc_points = [Point(x, 40, 0) for x in range(10, 50, 10)]
    markers.extend(create_lhc_marker(1, lhc_points, YELLOW, Point(8.0, 20.0, 8.0), "LHC"))

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
