#!/usr/bin/env python3
import rospy
from visualization_msgs.msg import Marker
from geometry_msgs.msg import Point
from std_msgs.msg import ColorRGBA

def create_room_marker(id, points, color, scale, text=""):
    marker = Marker()
    marker.header.frame_id = "map"
    marker.header.stamp = rospy.Time.now()
    marker.ns = "building_map"
    marker.id = id
    marker.type = Marker.CUBE_LIST
    marker.action = Marker.ADD
    marker.scale = scale
    marker.color = color
    marker.points = points

    if text:
        text_marker = Marker()
        text_marker.header = marker.header
        text_marker.ns = "building_labels"
        text_marker.id = id + 1000  # Ensure unique ID
        text_marker.type = Marker.TEXT_VIEW_FACING
        text_marker.action = Marker.ADD
        text_marker.scale.z = 2.0  # Text size
        text_marker.color = ColorRGBA(1.0, 1.0, 1.0, 1.0)  # White color
        text_marker.text = text
        text_marker.pose.position = Point(sum(p.x for p in points) / len(points),
                                          sum(p.y for p in points) / len(points),
                                          scale.z + 1)  # Position text above room
        return [marker, text_marker]
    return [marker]

def main():
    rospy.init_node('building_map_node')
    pub = rospy.Publisher('/building_map_visualization', Marker, queue_size=10)
    rate = rospy.Rate(1)

    markers = []

    # Define colors
    RED = ColorRGBA(1.0, 0.0, 0.0, 1.0)
    BLUE = ColorRGBA(0.0, 0.0, 1.0, 1.0)
    GREEN = ColorRGBA(0.0, 1.0, 0.0, 1.0)
    ORANGE = ColorRGBA(1.0, 0.65, 0.0, 1.0)

    # Rooms in the Academic Block
    room_101_points = [Point(0, 0, 0), Point(1, 1, 0)]
    markers.extend(create_room_marker(0, room_101_points, RED, Point(5.0, 5.0, 3.0), "Room 101"))

    room_102_points = [Point(5, 0, 0), Point(6, 1, 0)]
    markers.extend(create_room_marker(1, room_102_points, BLUE, Point(5.0, 5.0, 3.0), "Room 102"))

    room_103_points = [Point(10, 0, 0), Point(11, 1, 0)]
    markers.extend(create_room_marker(2, room_103_points, GREEN, Point(5.0, 5.0, 3.0), "Room 103"))

    # Hallway
    hallway_points = [Point(0, 5, -0.1), Point(10, 5, -0.1)]
    markers.extend(create_room_marker(3, hallway_points, ORANGE, Point(15.0, 2.0, 0.5), "Hallway"))

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
