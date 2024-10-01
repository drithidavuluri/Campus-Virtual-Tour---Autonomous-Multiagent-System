#!/usr/bin/env python3
import networkx as nx
import matplotlib.pyplot as plt
import random

# Function to create the campus map graph
def create_campus_graph():
    G = nx.Graph()

    # Adding buildings as nodes
    buildings = ["Entrance", "Library", "Academic Block", "Sports Complex", "Hostels", "LHC"]
    G.add_nodes_from(buildings)

    # Adding paths as edges (you can adjust weights for distance if needed)
    paths = [
        ("Entrance", "Library"),
        ("Entrance", "Academic Block"),
        ("Entrance", "Sports Complex"),
        ("Entrance", "Hostels"),
        ("Entrance", "LHC"),
        ("Library", "Academic Block"),
        ("Academic Block", "Sports Complex"),
        ("Hostels", "LHC"),
    ]
    G.add_edges_from(paths)

    return G

# Function to visualize the campus graph
def visualize_graph(G, agent_movements):
    pos = nx.spring_layout(G)  # Positioning of nodes

    plt.figure(figsize=(10, 6))
    
    # Draw nodes and edges
    nx.draw(G, pos, with_labels=True, node_color='lightblue', node_size=2000, font_size=10, font_weight='bold')
    nx.draw_networkx_edge_labels(G, pos, edge_labels={(u, v): 'Path' for u, v in G.edges()}, font_color='red')

    # Plot agent movements
    for movement in agent_movements:
        plt.plot([pos[movement[0]][0], pos[movement[1]][0]], [pos[movement[0]][1], pos[movement[1]][1]], 
                 color='green', linewidth=2, marker='o', markersize=5)

    plt.title("Campus Navigation and Agent Movements")
    plt.axis('off')  # Turn off the axis
    plt.show()

# Main function
def main():
    G = create_campus_graph()
    
    # Simulate random agent movements
    agent_movements = []
    for _ in range(10):  # Simulate 10 movements
        start = random.choice(list(G.nodes))
        end = random.choice(list(G.neighbors(start)))
        agent_movements.append((start, end))
    
    visualize_graph(G, agent_movements)

if __name__ == "__main__":
    main()
