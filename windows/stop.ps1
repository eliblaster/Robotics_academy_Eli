# Stop script for Windows - ROS2 Humble + Gazebo Harmonic
# Run this script in PowerShell

Write-Host "Stopping ROS2 container..." -ForegroundColor Yellow
docker-compose down
Write-Host "Container stopped." -ForegroundColor Green
