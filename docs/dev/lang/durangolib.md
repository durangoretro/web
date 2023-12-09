[Site map](../../sitemap.md))
[Home](../../index.md) > [Development](../../tools.md) > [Languages](../language.md) > C > **DurangoLib**

---
# DurangoLib

**DurangoLib** or Durango Computer Framework is a library written in _C_ that
can be used to generate new Software for Durango.

It's based on **user friendly** functions and tries to minimize development time,
helping you to configure everything needed to generate a new ROM or executable.

You can find the Source code in [our Github Repository](https://github.com/durangoretro/DurangoLib).

## Prerequisites

To use this library you need the following prerequisites:

* `make`
* [CC65](https://cc65.github.io/)
* Docker (only if you need to use the [Durango Docker Image](../tool/docker.md))

## Installation

To install this library you can follow two approaches:

- Install in your own machine:

	1. Download the last Release from the
	[release page](https://github.com/durangoretro/DurangoLib/releases).
	1. Unzip in your computer the downloaded `.zip` file.
	1. Create a new Environment Variable ```DDK``` (Durango Dev Kit) that contains
	the path where the `.zip` was unzipped.

- Use a [Docker Image](docker.md).

```bash
docker pull zerasul/durangodevkit:latest
```

## Compile Durango Lib

You can compile the Durango Lib, cloning the Source Code and generate a new version;
you'll need the following prerequisites.

* `make`
* [CC65](https://cc65.github.io/).
* `git`
* `curl`
* `zip` & `unzip`

To compile and generate the zip file:

```bash
make && make makeziplib
```

If you want to use the Docker Image:

```bash
docker run --rm -v $PWD:/src/durango zerasul/durangodevkit:latest make && make makeziplib
```

!!! warning

	This software is **under development** and is not suitable for production yet.
	We are working to improve this library and provide more user friendly information.

## Examples

You can find in the _examples_ folder, some examples to build. To compile each Example, you need first to Compile the Durango Framework.

```bash
git clone https://github.com/durangoretro/DurangoLib.git
make
```

Or if you are using Docker:

```bash
git clone https://github.com/durangoretro/DurangoLib.git
docker run --rm -v $PWD:/src/durango zerasul/durangodevkit:latest
```

Once you compile the last version of Durango Framework, you can compile each example:

```bash
make -C examples/
```

Or using Docker

```bash
docker run --rm -v $PWD:/src/durango zerasul/durangodevkit:latest make -C examples/
```

For more information about the examples or the Durango Lib, check the _docs_ folder
with the generated documentation.
