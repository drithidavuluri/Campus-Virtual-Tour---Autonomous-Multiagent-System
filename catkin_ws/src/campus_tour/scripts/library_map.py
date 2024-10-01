#!/usr/bin/env python3
import rospy
from visualization_msgs.msg import Marker
from geometry_msgs.msg import Point
from std_msgs.msg import ColorRGBA

def create_library_marker(id, points, color, scale, text=""):
    marker = Marker()
    marker.header.frame_id = "map"
    marker.header.stamp = rospy.Time.now()
    marker.ns = "campus_map"
    marker.id = id
    marker.type = Marker.CUBE_LIST
    marker.action = Marker.ADD
    marker.scale = scale
    marker.color = color
    marker.points = points

    # Initialize pose's orientation to identity quaternion
    marker.pose.orientation.x = 0.0
    marker.pose.orientation.y = 0.0
    marker.pose.orientation.z = 0.0
    marker.pose.orientation.w = 1.0

    if text:
        text_marker = Marker()
        text_marker.header = marker.header
        text_marker.ns = "campus_labels"
        text_marker.id = id + 1000  # Ensure unique ID
        text_marker.type = Marker.TEXT_VIEW_FACING
        text_marker.action = Marker.ADD
        text_marker.scale.z = 2.0  # Text size
        text_marker.color = ColorRGBA(1.0, 1.0, 1.0, 1.0)  # White color
        text_marker.text = text
        text_marker.pose.position = Point(sum(p.x for p in points) / len(points),
                                          sum(p.y for p in points) / len(points),
                                          scale.z + 1)  # Position text above the building
        # Initialize text marker's orientation
        text_marker.pose.orientation.x = 0.0
        text_marker.pose.orientation.y = 0.0
        text_marker.pose.orientation.z = 0.0
        text_marker.pose.orientation.w = 1.0

        return [marker, text_marker]
    
    return [marker]



def main():
    rospy.init_node('library_map_node')
    pub = rospy.Publisher('/library_map_visualization', Marker, queue_size=10)
    rate = rospy.Rate(1)

    markers = []

    # Define colors
    RED = ColorRGBA(1.0, 0.0, 0.0, 1.0)
    GREEN = ColorRGBA(0.0, 1.0, 0.0, 1.0)
    BLUE = ColorRGBA(0.0, 0.0, 1.0, 1.0)
    YELLOW = ColorRGBA(1.0, 1.0, 0.0, 1.0)

    # Library Building Structure
    library_outer_walls = [Point(50, 20, 0), Point(70, 20, 0), Point(70, 40, 0), Point(50, 40, 0)]
    markers.extend(create_library_marker(1, library_outer_walls, BLUE, Point(0.5, 0.5, 5.0), "Library Outer Walls"))

    # Library Rooms
    reading_room_points = [Point(52, 22, 0), Point(60, 22, 0), Point(60, 30, 0), Point(52, 30, 0)]
    markers.extend(create_library_marker(2, reading_room_points, GREEN, Point(0.5, 0.5, 5.0), "Reading Room"))

    computer_lab_points = [Point(62, 22, 0), Point(68, 22, 0), Point(68, 30, 0), Point(62, 30, 0)]
    markers.extend(create_library_marker(3, computer_lab_points, RED, Point(0.5, 0.5, 5.0), "Computer Lab"))

    # Pathways
    pathway_points = [Point(55, 32, 0), Point(65, 32, 0)]
    markers.extend(create_library_marker(4, pathway_points, YELLOW, Point(1.0, 0.2, 0.1), "Pathway"))

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
