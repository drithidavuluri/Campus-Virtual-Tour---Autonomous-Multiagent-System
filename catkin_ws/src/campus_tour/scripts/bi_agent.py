#!/usr/bin/env python3
import rospy
from std_msgs.msg import String
import random

class BIAGent:
    def __init__(self, building_name):
        self.building_name = building_name
        self.busy = False

        rospy.init_node(f'bi_agent_{self.building_name}', anonymous=True)
        self.publisher = rospy.Publisher(f'/bi_agent_{self.building_name}/response', String, queue_size=10)
        rospy.Subscriber(f'/ci_agent_{self.building_name}/request', String, self.respond_to_request)

    def log_message(self, message):
        timestamp = rospy.get_time()
        with open("interaction_log.txt", "a") as log_file:
            log_file.write(f"[{timestamp}] [bi_agent_{self.building_name}]: {message}\n")

    def respond_to_request(self, request):
        if self.busy:
            response = "I am currently out of service."
            self.log_message(response)
            return response
        
        self.busy = True
        self.log_message(f"Received request from {request.data}.")
        response = self.simulate_response()
        self.log_message(response)
        self.busy = False
        self.publisher.publish(response)

    def simulate_response(self):
        return random.choice([
            f"{self.building_name} map is provided.",
            "Host is not available.",
            "I am currently out of service."
        ])

if __name__ == '__main__':
    try:
        buildings = ["library", "academic_block", "sports_complex", "hostels", "lhc"]
        for building in buildings:
            bi_agent = BIAGent(building)
            rospy.spin()
    except rospy.ROSInterruptException:
        pass

