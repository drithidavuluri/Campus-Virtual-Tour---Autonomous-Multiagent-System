# Campus Virtual Tour - Autonomous Multiagent System

## Project Overview:

This project involves the creation of a multiagent system for an autonomous campus virtual tour using ROS (Robot Operating System) as the middleware. The agents, namely Campus Incharge (CI), Building Incharge (BI), and Visitor agents, interact via a publish-subscribe model to provide real-time information about campus buildings.

---

## Key Features:
1. **ROS Middleware:** Used for agent communication and simulation.
2. **CrewAI Integration:** Applied for agent behavior coordination.
3. **Map Visualization:** Campus buildings and navigation paths are visualized using RViz.
4. **Custom Message Types:** Created to facilitate communication between agents.

---

## How to Run:

1. Clone the repository.
2. Set up the ROS environment:
   ```
   mkdir -p ~/catkin_ws/src
   cd ~/catkin_ws/
   catkin_make
   source devel/setup.bash
   ```
3. Install required dependencies:
   ```
   pip install crewai rospy
   ```
4. Build and run the system:
   ```
   cd ~/catkin_ws/src
   catkin_create_pkg campus_tour rospy std_msgs
   catkin_make
   ```
5. Visualize the campus map in RViz:
   ```
   rosrun campus_tour campus_tour.rviz
   ```
