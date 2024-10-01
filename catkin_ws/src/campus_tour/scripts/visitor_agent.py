#!/usr/bin/env python3
import rospy
from std_msgs.msg import String
import random

class VisitorAgent:
    def __init__(self, visitor_id):
        self.visitor_id = visitor_id
        self.ci_agents = [f"ci_agent_{i}" for i in range(1, 6)]
        self.make_request()

    def make_request(self):
        rospy.init_node(f'visitor_agent_{self.visitor_id}', anonymous=True)
        rate = rospy.Rate(1)  # Request every second
        while not rospy.is_shutdown():
            ci_agent = random.choice(self.ci_agents)
            self.request_assistance(ci_agent)
            rate.sleep()

    def request_assistance(self, ci_agent):
        rospy.loginfo(f"[Visitor {self.visitor_id}]: Requesting assistance from {ci_agent}.")
        ci_agent_pub = rospy.Publisher(f'/{ci_agent}/request', String, queue_size=10)
        ci_agent_pub.publish(f"Visitor {self.visitor_id}")

if __name__ == '__main__':
    try:
        visitor_agent = VisitorAgent(1)  # Example Visitor agent with ID 1
        rospy.spin()
    except rospy.ROSInterruptException:
        pass


