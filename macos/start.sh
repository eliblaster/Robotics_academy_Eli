#!/bin/bash
# Start script for macOS - ROS2 Humble + Gazebo Harmonic

echo "=========================================="
echo "ROS2 Humble + Gazebo Harmonic - macOS"
echo "=========================================="

# Check if XQuartz is installed
if ! command -v xquartz &> /dev/null && [ ! -d "/Applications/Utilities/XQuartz.app" ]; then
    echo "ERROR: XQuartz not found!"
    echo "Please install XQuartz from: https://www.xquartz.org/"
    echo "After installation, log out and log back in."
    exit 1
fi

# Start XQuartz if not running
echo "[1/5] Starting XQuartz..."
open -a XQuartz 2>/dev/null || true
sleep 2

# Allow network connections to XQuartz
echo "[2/5] Configuring XQuartz permissions..."
xhost +localhost > /dev/null 2>&1

# Set DISPLAY for this session
export DISPLAY=host.docker.internal:0

# Create workspace directory if it doesn't exist
echo "[3/5] Checking workspace directory..."
mkdir -p ./ros2_ws/src

# Build and start the container
echo "[4/5] Starting Docker container..."
docker-compose up -d

if [ $? -ne 0 ]; then
    echo "ERROR: Failed to start container."
    echo "Make sure Docker Desktop is running."
    exit 1
fi

# Enter the container
echo "[5/5] Entering container..."
echo ""
echo "You are now inside the ROS2 container."
echo "Type 'exit' to leave the container."
echo "=========================================="
echo ""

docker exec -it ros2_course_container bash
