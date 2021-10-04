---
title: "Kubernetes basics"
date: 2021-05-01T21:55:06+01:00
draft: false
hideLastModified: true
summaryImage: "images/k8s.png"
keepImageRatio: true
tags: ["kubernetes"]
summary: "Kubernetes key principles and functionalities."
---
What is kubernetes
----------

Kubernetes is a open source *container* *orchestrator* and
*manager* created by Google that is widely used by many cloud providers
worldwide. Kubernetes arose from the need to coordinate the system from
the perspective of applications. Its goal is to assist developers in
deploying applications and automating the management of services exposed
to end users. The mere use of dockers complicates management because
there are no automatic systems in place to allow, for example, automatic
load balancing between instances or automatic scaling in response to
needs. Furthermore, because different instances of the same
microservices can run on multiple servers and are subject to continuous
destruction and creation processes, automatic communication and
management of the various replicas is impossible. The most important
features offered by Kubernetes are:

-   From a deployment standpoint, the ability to automatically schedule
    microservices on various servers;

-   Assure the running of a defined number of copies of the services
    chosen by the manager operator. When one instance of the same
    service goes down, it has the capacity to rebuild it.

-   Autoscaling functionality: Allows you to scale up or down the number
    of microservice instances based on the consumption of specific
    parameters.

-   A load balancer capacity to distribute traffic among the multiple
    instances of the microservices to avoid overloads that could cause
    problems.

-   Ability to create a virtual networking within the system to ensure
    isolation between microservices.

-   Ability to monitor the functioning of the applications, their use,
    and their status (health check). Kubernetes immediately restarts the
    service if an error occurs.

-   Ability to simulate a DNS which keeps track of where exactly the
    application to contact is, unknown from the outside.
