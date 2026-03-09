# ROS2 Humble + Gazebo Harmonic Docker Setup

This Docker environment provides a complete ROS2 Humble and Gazebo Harmonic setup for the robotics course.

## Choose Your Operating System

We provide optimized Docker configurations for each operating system:

| OS | Folder | Quick Start |
|----|--------|-------------|
| **Linux** | [`linux/`](linux/) | `./start.sh` |
| **Windows** | [`windows/`](windows/) | `.\start.ps1` or `start.bat` |
| **macOS** | [`macos/`](macos/) | `./start.sh` |

Navigate to your OS folder and follow the README instructions there.
In general, we recommend to do the dual boot/virtual machine for better perfomences and compatibility, specially if you have macos.

## What's Included

- **ROS2 Humble** - Full desktop installation
- **Gazebo Harmonic** - Latest Gazebo simulator
- **ROS2-Gazebo Bridge** - Integration packages
- **Development Tools** - colcon, vcstool, rosdep
- **Visualization** - RViz2, rqt tools
- **Common Packages** - xacro, robot_state_publisher, teleop

## Directory Structure

```
.
├── linux/              # Linux Docker setup
│   ├── Dockerfile
│   ├── docker-compose.yml
│   ├── start.sh
│   ├── stop.sh
│   └── README.md
├── windows/            # Windows Docker setup
│   ├── Dockerfile
│   ├── docker-compose.yml
│   ├── start.ps1
│   ├── start.bat
│   ├── stop.ps1
│   └── README.md
├── macos/              # macOS Docker setup
│   ├── Dockerfile
│   ├── docker-compose.yml
│   ├── start.sh
│   ├── stop.sh
│   └── README.md
└── README.md           # This file
```

## Quick Start (All Platforms)

1. **Install Docker Desktop**
   - Download from: https://www.docker.com/products/docker-desktop/

2. **Navigate to your OS folder**
   ```bash
   cd linux/    # or windows/ or macos/
   ```

3. **Run the start script**
   - Linux/macOS: `./start.sh`
   - Windows: `.\start.ps1` or double-click `start.bat`

4. **Test the installation** (inside the container)
   ```bash
   ros2 topic list
   gz sim shapes.sdf
   ```

## ROS2 Workspace

Each OS setup creates a `ros2_ws/` folder in the respective directory:
- `linux/ros2_ws/`
- `windows/ros2_ws/`
- `macos/ros2_ws/`

This folder is **shared** between your host machine and the container:
- Edit code with your favorite IDE on your computer
- Build and run in the container
- Changes persist even after restarting the container

## Helpful Aliases (Inside Container)

| Alias | Command | Description |
|-------|---------|-------------|
| `cb` | `colcon build --symlink-install` | Build workspace |
| `sw` | `source install/setup.bash` | Source workspace |
| `cbsw` | Build + Source | Combined |

## Platform Notes

### Linux
- Best performance with native GPU support
- NVIDIA GPU acceleration available (see Linux README)
- Full ROS2 DDS communication with host network

### Windows
- Requires WSL2 backend
- Windows 11 (WSLg) recommended for best GUI support
- Windows 10 users need VcXsrv

### macOS
- Requires XQuartz for GUI applications
- Apple Silicon (M1/M2/M3) works via emulation
- Performance may be slower than Linux

## Getting Help

1. Check the OS-specific README in your folder
2. Common issues are covered in Troubleshooting sections
3. ROS2 Documentation: https://docs.ros.org/en/humble/
4. Gazebo Documentation: https://gazebosim.org/docs/harmonic

---
*ROS2 Course Docker Environment v1.0*
