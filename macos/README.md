# ROS2 Humble + Gazebo Harmonic - macOS Setup

## Prerequisites

1. **Docker Desktop for Mac**
   - Download from: https://www.docker.com/products/docker-desktop/
   - Works on both Intel and Apple Silicon (M1/M2/M3) Macs

2. **XQuartz** (X Window System for macOS)
   - Download from: https://www.xquartz.org/
   - **Important:** After installing XQuartz, **log out and log back in**

3. **Configure XQuartz for Docker:**
   - Open XQuartz
   - Go to **XQuartz → Preferences → Security**
   - Check ✅ **"Allow connections from network clients"**
   - Restart XQuartz

## Quick Start

### Option 1: Using the start script (Recommended)
```bash
cd macos
chmod +x start.sh stop.sh
./start.sh
```

### Option 2: Manual commands
```bash
# Start XQuartz
open -a XQuartz

# Allow network connections
xhost +localhost

# Create workspace
mkdir -p ros2_ws/src

# Build the image (first time only, takes 10-20 min)
docker-compose build

# Start the container
docker-compose up -d

# Enter the container
docker exec -it ros2_course_container bash
```

## Testing the Installation

Inside the container:
```bash
# Test ROS2
ros2 topic list

# Test GUI (should open a window)
ros2 run rviz2 rviz2

# Test Gazebo (may be slow on macOS)
gz sim shapes.sdf
```

## Helpful Aliases

Inside the container:
- `cb` - Build workspace
- `sw` - Source workspace
- `cbsw` - Build and source combined

## Stopping the Container

```bash
./stop.sh
# or
docker-compose down
```

## Apple Silicon (M1/M2/M3) Notes

- Docker runs x86_64 images through Rosetta 2 emulation
- **Performance will be slower** than on Intel Macs or Linux
- This is normal - the ROS2 ecosystem is primarily built for x86_64
- For better performance, consider using a Linux VM or dual-boot

### Performance Tips for Apple Silicon:
1. Allocate more RAM to Docker Desktop (Settings → Resources)
2. Use software rendering (already configured in docker-compose.yml)
3. Close unnecessary applications while running simulations

## Troubleshooting

### GUI not showing

1. **Check XQuartz is running:**
   ```bash
   # Should show XQuartz process
   ps aux | grep -i xquartz
   ```

2. **Verify XQuartz settings:**
   - XQuartz → Preferences → Security → "Allow connections from network clients" must be checked

3. **Allow network connections:**
   ```bash
   xhost +localhost
   ```

4. **Check DISPLAY variable:**
   ```bash
   echo $DISPLAY
   # Should show something like ":0" or "host.docker.internal:0"
   ```

### "Cannot open display" error
```bash
# Make sure XQuartz is running
open -a XQuartz

# Allow connections
xhost +localhost

# Verify from terminal
echo $DISPLAY
```

### Docker build fails on Apple Silicon
```bash
# Try building with platform flag
docker-compose build --build-arg TARGETPLATFORM=linux/amd64
```

### Performance is very slow
This is expected on macOS, especially Apple Silicon. Options:
1. Lower Gazebo physics update rate
2. Use simpler robot models
3. Disable unnecessary visualizations
4. Consider using a Linux environment for heavy simulations

### Permission errors on workspace files
Inside the container:
```bash
sudo chown -R ros2user:ros2user ~/ros2_ws
```

### XQuartz windows are tiny (Retina displays)
```bash
# In the container, try scaling
export QT_SCALE_FACTOR=2
```

## Recommended Workflow

Since macOS performance can be limited:

1. **Develop code** on macOS using VS Code
2. **Build packages** inside the container
3. **Test simple nodes** in the container
4. **Run heavy simulations** on a Linux machine or cloud VM if available

## File Locations

- Your ROS2 packages: `./ros2_ws/src/`
- This folder is shared between macOS and the container
- Edit files with your favorite editor on macOS, run them in the container
