---
title: "Kubernetes architecture"
date: 2019-06-04T21:55:06+01:00
draft: false
hideLastModified: true
tags: ["kubernetes", "architecture"]
---
## Architecture
The software architecture is depicted in the above picture.
There are different types of components, 1) node components, which are components that must be installed and run on each node, and 2) k8s master component, which are component running on the master node.
### Node components
#### Container runtime
First, for letting K8s work, a container runtime is needed, like Docker. This is because pods are basically abstractions for containers, and therefore a container runtime must be run on every node.
#### Kubelet
Kubelet is the process internal to K8s, unlike the container runtime, which actually is in charge of scheduling the pods and the underneath containers. The kubelet has interfaces with the container runtime and the underneath node, so it is able to start the pod with a container inside. The kubelet process must run on every node.
#### Kube proxy
Also this component must be installed on every node, and is responsible for forwarding requests from services to pods. Kube proxy has an intelligent forwarding logic inside, that make sure that the communication works in a performant way with low overhead.
### Master components
The master node has completely different processes running inside, needed to control the node state. To handle scalability, it is the case that more than one master component could be present.
#### API server
When an application is deployed into a K8s cluster, it interacts with the API server, which can be the Kubernetes dashboard (UI) or the command line (kubectl). Therefore, the API server is like a cluster gateway, that acts also as a gatekeeper for authentication, ensuring that also authorized operation are performed on the cluster. Therefore, all requests are submitted to the API server, which is in charge of validating them and redirecting to the corresponding process which will handle them. This is a REST server which interacts with CRUD operations.
#### Scheduler
Whenever a new pod is scheduled, the API server redirects to the Scheduler, which is in charge of actually start the application pod on one of the worker nodes. The scheduler has its own smart way of deciding on which node is good to schedule a given request, based on the resources needed by the application to schedule.
#### Controller manager
This component is needed when pods die on any node. The controller is in charge of detecting state changes and trying of recovering the desired condition.
#### Etcd
It is the “cluster brain”, a fast key-value database which works on main memory containing all the resources active within the cluster.
