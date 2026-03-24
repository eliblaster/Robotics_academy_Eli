# Set up(docker)

- **important note**: in docker before executing the following commands you have to set in preferences -> resources -> file sharing the path to the github folder

MacOS:

```
docker run -d \
  --pull always \
  -p 6080:80 \
  -p 9090:9090 \
  --security-opt seccomp=unconfined \
  --shm-size=512m \
  -v "/Users/<username>/<path_to_github>/yourrepo:/github" \
  --name racademy \
  voss01dev/racademy:arm64
```

Windows:
use regular shell CMD (do not use wsl)

```
docker run -d ^
  --pull always ^
  -p 6080:80 ^
  -p 9090:9090 ^
  --security-opt seccomp=unconfined ^
  --shm-size=512m ^
  -v "C:\Users\<username>\<path_to_github>:/github" ^
  --name racademy ^
  voss01dev/racademy:amd64
```

At this point you should get as output a bunch of `RUNNING state` lines and you can proceed.

### Note

The `-v /Users/<username>/<path_to_github>:/github` part of the Docker run command establishes a volume mount. This allows you to share data between your host machine and the Docker container. Here's a breakdown of this volume mount:

`/Users/<username>/<path_to_github>`: with the actual path on your host machine that corresponds to the github folder, that way it will be accessible from the Docker container.

`:/github`: This is the path inside the Docker container where the shared data will be available. In this case, it's mounted at `/github`.

### Accessing the GUI

After running the container, you can access the graphical user interface (GUI) by opening a web browser and navigating to `http://localhost:6080`. The container exposes the GUI on port 6080, allowing you to interact with the simulation environment.

### To restart the container when closed

(you should always have the docker app running in the background) in the computer terminal/shell write:
To start the stopped container:

```
docker start racademy
```

To enter into the shell:

```
docker exec -it racademy /bin/sh
```

---
