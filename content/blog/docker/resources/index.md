---
title: "Docker resources"
date: 2021-05-02T21:55:06+01:00
draft: false
hideLastModified: true
summaryImage: "images/docker.png"
keepImageRatio: true
tags: ["docker"]
summary: "Short overview of Docker resources"
---
The core components that compose Docker will now be briefly explained.

### The Docker client and server

Docker is a server-client application. The **Docker client**
communicates with the **Docker server** or **daemon**, which then
completes the task. Docker comes with a `docker` command-line client
binary and a full *RESTful API*. It’s possible to run the Docker daemon
and client on the same machine or connect the local Docker client to a
remote Docker daemon on a different machine.The figure shows
a diagram of Docker’s architecture:

{{< figure src="images/2-dockerarchitecture.jpg" width="700" >}}

### Docker images

The foundation of the Docker world is images. All Docker containers are
launched from images. Images are the “*build*” part of Docker’s life
cycle. They are a layered format that is built step-by-step using *Union
file systems* and a set of instructions.

### Registries

Docker stores of the images in **registries**. *Public* and *private*
registries are the two types of registries. *Docker, Inc.* manages the
Docker Hub registry, which is a public image registry. The Docker Hub
also has over 10,000 images that other people or organizations have
created and shared.

### Containers

**Containers** are launched from images and can contain one or more
*running processes*. If images are the building or packing aspect of
Docker, the containers represent the running or execution aspect. Each
container contains a software image – its ’*cargo*’ – and, like its
physical counterpart, allows a set of operations to be performed. For
example, it can be *created*, *started*, *stopped*, *restarted*, and
*destroyed*.