#!/bin/bash
# Stop script for macOS - ROS2 Humble + Gazebo Harmonic

echo "Stopping ROS2 container..."
docker-compose down
echo "Container stopped."

# Optionally revoke XQuartz permissions
# xhost -localhost
