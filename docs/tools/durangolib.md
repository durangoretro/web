# Durango Lib

Durango Lib or Durango Computer Framework, is a library written in C, that can be used to generate new Software for Durango.

Is based on user friendly functions and try to minimize the Development time; helping you to configure all the necessary configuration to generate a new ROM.

You can find the Source code in our Github Repository:

[https://github.com/durangoretro/DurangoLib](https://github.com/durangoretro/DurangoLib)

## Prerequisites

To use this library you need the next prerequisites:

* make
* CC65
* Docker (only if you need to use the [Durango Docker Image](docker.md))

## Installation

To install this library you can follow two approaches:

1. Install in your own machine:
    a. Download the last Release from [Release Page](https://github.com/durangoretro/DurangoLib/releases).
    b. Unzip in your computer the downloaded zip file.
    c. Create a new Environment Variable ```DDK``` (Durango Dev Kit) that contains the path where the Zip was unzipped.
2. Use a [Docker Image](docker.md).

```bash
docker pull zerasul/durangodevkit:latest
```

## Compile Durango Lib

You can compile the Durango Lib, cloning the Source Code and generate a new version; you need the next prerequisites.

* Make
* [CC65](https://cc65.github.io/).
* Git
* Curl
* zip & unzip

To compile and generate the zip file:

```bash
make && make makeziplib
```

If you want to use the Docker Image:

```bash
docker run --rm -v $PWD:/src/durango zerasul/durangodevkit:latest make && make makeziplib
```

!!! warning

    This software is under development and is not suitable for production ready Yet. We are working to improve this library and provide more user friendly information.