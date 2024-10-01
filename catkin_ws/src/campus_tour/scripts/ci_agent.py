#!/usr/bin/env python3
import rospy
from std_msgs.msg import String
import random
import time

class CIAgent:
    def __init__(self, agent_id):
        self.agent_id = agent_id
        self.visitor_name = ""
        self.busy = False

        rospy.init_node(f'ci_agent_{self.agent_id}', anonymous=True)
        rospy.Subscriber(f'/ci_agent_{self.agent_id}/request', String, self.request_callback)
        self.publisher = rospy.Publisher(f'/ci_agent_{self.agent_id}/response', String, queue_size=10)

        self.building_map = {
            "library": "library_map",
            "academic_block": "academic_block_map",
            "sports_complex": "sports_complex_map",
            "hostels": "hostels_map",
            "lhc": "lhc_map"
        }

    def log_message(self, message):
        timestamp = rospy.get_time()
        with open("interaction_log.txt", "a") as log_file:
            log_file.write(f"[{timestamp}] [{self.agent_id}]: {message}\n")

    def request_callback(self, msg):
        self.visitor_name = msg.data
        self.log_message(f"Assisting {self.visitor_name}.")
        self.handle_request()

    def handle_request(self):
        if self.busy:
            response = "I am currently busy."
            self.log_message(response)
            self.publisher.publish(response)
            return

        self.busy = True
        building = random.choice(list(self.building_map.keys()))
        bi_agent_name = f"bi_agent_{building}"
        
        self.log_message(f"Contacting {bi_agent_name} for {building} map.")
        time.sleep(1)  # Simulate delay
        self.publisher.publish(bi_agent_name)

        bi_response = self.simulate_bi_response()
        self.log_message(bi_response)
        self.publisher.publish(bi_response)

        if "provided" in bi_response:
            self.log_message(f"Taking {self.visitor_name} to the host in {building}.")
            time.sleep(2)
            self.log_message(f"Returned {self.visitor_name} to entrance.")
        
        self.busy = False

    def simulate_bi_response(self):
        responses = [
            f"{self.visitor_name}, your map for {random.choice(list(self.building_map.keys()))} is provided.",
            f"{self.visitor_name}, host is not available.",
            f"{self.visitor_name}, I am currently out of service."
        ]
        return random.choice(responses)

if __name__ == '__main__':
    try:
        ci_agent = CIAgent(1)  # Example CI agent with ID 1
        rospy.spin()
    except rospy.ROSInterruptException:
        pass


