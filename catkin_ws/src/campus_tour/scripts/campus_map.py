#!/usr/bin/env python3
import rospy
from visualization_msgs.msg import Marker
from geometry_msgs.msg import Point
from std_msgs.msg import ColorRGBA

def create_building_marker(id, points, color, scale, text=""):
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
                                          scale.z + 1)  # Position text above building
        return [marker, text_marker]
    return [marker]

def main():
    rospy.init_node('campus_map_node')
    pub = rospy.Publisher('/campus_map_visualization', Marker, queue_size=10)
    rate = rospy.Rate(1)

    markers = []

    # Define colors
    RED = ColorRGBA(1.0, 0.0, 0.0, 1.0)
    GREEN = ColorRGBA(0.0, 1.0, 0.0, 1.0)
    BLUE = ColorRGBA(0.0, 0.0, 1.0, 1.0)
    YELLOW = ColorRGBA(1.0, 1.0, 0.0, 1.0)
    ORANGE = ColorRGBA(1.0, 0.65, 0.0, 1.0)
    PURPLE = ColorRGBA(0.5, 0.0, 0.5, 1.0)

    # Entrance Gate
    gate_points = [Point(0, 0, 0), Point(1, 0, 0)]
    markers.extend(create_building_marker(0, gate_points, RED, Point(2.0, 0.5, 3.0), "Entrance Gate"))

    # Main Academic Block
    academic_points = [Point(x, y, 0) for x in range(10, 40, 10) for y in range(10, 30, 10)]
    markers.extend(create_building_marker(1, academic_points, BLUE, Point(8.0, 8.0, 10.0), "Academic Block"))

    # Library
    library_points = [Point(50, 20, 0)]
    markers.extend(create_building_marker(2, library_points, GREEN, Point(15.0, 15.0, 12.0), "Library"))

    # Lecture Hall Complex (LHC)
    lhc_points = [Point(x, 40, 0) for x in range(10, 50, 10)]
    markers.extend(create_building_marker(3, lhc_points, YELLOW, Point(8.0, 20.0, 8.0), "LHC"))

    # Hostels
    hostel_points = [Point(x, y, 0) for x in range(60, 100, 20) for y in range(10, 50, 20)]
    for i, point in enumerate(hostel_points):
        markers.extend(create_building_marker(4 + i, [point], ORANGE, Point(15.0, 15.0, 15.0), f"Hostel {i+1}"))

    # Sports Complex
    sports_points = [Point(80, 60, 0)]
    markers.extend(create_building_marker(10, sports_points, PURPLE, Point(30.0, 20.0, 5.0), "Sports Complex"))

    # Roads (as thin, long cubes)
    road_color = ColorRGBA(0.3, 0.3, 0.3, 1.0)  # Dark gray
    roads = [
        ([Point(0, 5, -0.1), Point(50, 5, -0.1)], Point(100.0, 8.0, 0.1)),  # Main road
        ([Point(5, 0, -0.1), Point(5, 60, -0.1)], Point(8.0, 120.0, 0.1)),  # Vertical road
        ([Point(50, 5, -0.1), Point(50, 60, -0.1)], Point(8.0, 110.0, 0.1)),  # Another vertical road
    ]
    for i, (points, scale) in enumerate(roads):
        markers.extend(create_building_marker(100 + i, points, road_color, scale))

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