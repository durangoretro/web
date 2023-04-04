# Docker

You can use Docker to compile and use tools for develop for Durango Ecosystem. You can find Durango Docker Images in [Docker Hub](https://hub.docker.com/r/zerasul/durangodevkit).

!!! note "Arm tags"

    The images for Arm based architecture, are taged with the sufix _-arm_.

This image includes:

* xa65 assembler for 6502.
* cc65 C Compiler.
* Durango Computer Lib.

To locate the Durango computer lib files, you can use the ```$DDK``` environment variable.

!!! warning "Under Development"

    These images are under development and can be changed.

To use this image, you can use the next command:

```bash
docker run --rm -v $PWD:/src/durango zerasul/durangodevkit
```

By default, the ```make``` command is executed.

The current DockerFile, is located in the [DurangoRetro repository](https://github.com/durangoretro/DurangoDocker).

For more information about Docker, please check [Docker Web Page](https://www.docker.com/).
