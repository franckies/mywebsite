---
title: "Docker basics"
date: 2021-10-04T21:55:06+01:00
draft: false
hideLastModified: true
summaryImage: "images/docker.png"
keepImageRatio: true
tags: ["docker"]
summary: "Docker key principles and functionalities."
---
What is Docker
----------

Docker is a free and open-source engine for deploying
applications into **containers**. Docker, Inc. (formerly dotCloud Inc.,
an early player in the Platform-as-a-Service (PAAS) market) wrote it and
released it under the Apache 2.0 license. On top of a
virtualized container execution environment, Docker adds an application
deployment engine. It’s intended to provide a lightweight and fast
environment for running your code, as well as an efficient workflow for
moving that code from your laptop to your test environment and then into
production. Some of the key feature offered by Docker are:
-   **Easy and lightweight**: In just a few minutes, it is possible to
    *Dockerize* an application. Because Docker uses a *copy-on-write*
    model, making changes to the application is lightning fast: only the
    parts you want to change are changed. After that, it is possible to
    create containers that run the applications. The majority of Docker
    containers launch in less than a second. Because the hypervisor
    overhead has been removed, containers are now extremely fast, they
    can be packed into the hosts and make the most efficient use of your
    resources.

-   **Logical segregation**: Developers care about their applications
    running inside containers with Docker, while Operations is concerned
    with container management. Docker is intended to improve consistency
    by ensuring that the environment in which developers write code
    corresponds to the environments in which your applications are
    deployed. This reduces the risk of “*worked in development, now a
    problem in operations.*”

-   **Fast and efficient development life-cycle**: Docker aims to
    shorten the time it takes for code to be written, tested, deployed,
    and used. Its goal is to make applications portable, easy to create,
    and collaborate on.

-   **Encourages Microservice architectures**: Service-oriented and
    microservices architectures are also encouraged by Docker. Each
    container should run a single application or process, according to
    Docker. This encourages the use of a distributed application model,
    in which a single application or service is represented by a
    collection of interconnected containers. This makes distributing,
    scaling, debugging, and inspecting applications very easy.