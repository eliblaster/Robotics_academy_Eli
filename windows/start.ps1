# Start script for Windows - ROS2 Humble + Gazebo Harmonic
# Run this script in PowerShell

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "ROS2 Humble + Gazebo Harmonic - Windows" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan

# Create workspace directory if it doesn't exist
Write-Host "[1/3] Checking workspace directory..." -ForegroundColor Yellow
if (-not (Test-Path ".\ros2_ws\src")) {
    New-Item -ItemType Directory -Force -Path ".\ros2_ws\src" | Out-Null
    Write-Host "       Created ros2_ws/src directory" -ForegroundColor Green
}

# Build and start the container
Write-Host "[2/3] Starting Docker container..." -ForegroundColor Yellow
docker-compose up -d

if ($LASTEXITCODE -eq 0) {
    Write-Host "       Container started successfully" -ForegroundColor Green
} else {
    Write-Host "       Failed to start container. Check Docker Desktop is running." -ForegroundColor Red
    exit 1
}

# Enter the container
Write-Host "[3/3] Entering container..." -ForegroundColor Yellow
Write-Host ""
Write-Host "You are now inside the ROS2 container." -ForegroundColor Green
Write-Host "Type 'exit' to leave the container." -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

docker exec -it ros2_course_container bash
