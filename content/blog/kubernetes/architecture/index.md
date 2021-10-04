---
title: "Kubernetes architecture"
date: 2021-05-03T21:55:06+01:00
draft: false
hideLastModified: true
summaryImage: "images/k8s.png"
keepImageRatio: true
tags: ["kubernetes"]
summary: "Short overview of the Kubernetes software architecture."
---
## Architecture
The software architecture is depicted in the below picture.
There are different types of components, 1) node components, which are components that must be installed and run on each node, and 2) k8s master component, which are component running on the master node.
{{< figure src="images/architecturek8s.png" width="700" >}}
### Node components
{{< figure src="images/2-k8sworker.jpg" width="700" >}}
#### Container runtime
The container runtime manages the entire container life-cycle. Kubernetes implements a **Container Runtime Interface** (*CRI*). which masks the internal machinery of Kubernetes and exposes a clean documented interface for 3rd-party
container runtimes to plug into.There are lots of container runtimes
available for Kubernetes, the most popular ones are **Docker**,
**containerd**, and **CRI-O**.

#### Kubelet
The kubelet is the main kubernetes agent which runs on each node of the cluster. The kubelet is in charge of registering the node with the cluster. The node’s CPU, memory, and storage are effectively pooled into the cluster pool after registration. One of the kubelet’s key responsibilities is to keep an eye on the API server for new work assignments. Whenever it sees one, the kubelet performs the task and maintains a reporting channel back to the control plane. If a kubelet is unable to complete a task, it informs the master and the control plane, which then decides what actions to take. For example, if a Kubelet is unable to complete a task, it is not responsible for locating another node on which to complete it: it just reports back to the control plane, which takes the final decision.
#### Kube proxy
Kube-proxy runs on every node in the cluster and is responsible for local cluster networking. For example, it makes sure each node gets its own unique IP address, and implements local *IPTABLES* or *IPVS* rules to handle routing and load-balancing of traffic on the Pod network.

### Master components
A Kubernetes master is a group of system services that make up the
cluster’s control plane. All of the master services are executed on a
single host in the simplest installations. However, this is only
appropriate for use in laboratories and test situations. Multi-master
high availability (HA) is a necessary in production applications. This
is why major cloud providers like **Azure Kubernetes Service** (*AKS*),
**AWS Elastic Kubernetes Service** (*EKS*), and **Google Kubernetes
Engine** (*GKE*) include HA masters in their hosted Kubernetes systems .
In general, in a *HA* arrangement, three or five replicated masters are
suggested. The different master services that make up the control plane
are the following.


{{< figure src="images/2-k8smaster.jpg" width="700" >}}

#### API server
All communication between Kubernetes components must occur through the API server. It has a RESTful API that can be used to `POST` *YAML* configuration files over HTTPS. The desired state of the program is stored in these YAML files, which are also known as *manifests*. Many things are included in the intended state, such as the container image to use, the ports to expose, and the number of Pod clones to run. Authentication and authorisation checks are performed on all API Server calls, but once they are completed, the YAML file’s configuration is validated, persisted to the cluster store, and deployed to the cluster.
#### Scheduler
The scheduler monitors the API server for new
    work tasks and assigns them to healthy nodes that are available. It
    uses complex logic behind the scenes to filter out nodes that aren’t
    capable of completing the task and then rank the ones that are. The
    task cannot be scheduled if the scheduler cannot find a suitable
    node, and it is marked as pending. Beware that the scheduler isn’t
    in charge of launching tasks; it’s just in charge of determining
    which nodes a job will run on.
#### Controller manager
All of the background control loops that
    monitor the cluster and respond to events are implemented by the
    controller manager. It’s a “*controller of controllers*”, which
    means it generates and monitors all of the independent control
    loops. The **node controller**, **endpoints controller**, and
    **replicaset controller** are examples of control loops. Each one
    operates as a background watch-loop that monitors the API Server for
    changes in order to guarantee that the cluster’s current state
    matches the desired state.

### Cloud controller manager
Your control plane will be running
    a cloud controller manager if the cluster is running on a supported
    public cloud platform like *AWS*, *Azure*, *GCP*, and so on. Its job
    is to oversee integrations with underlying cloud technologies and
    services like instances, load balancers, and storage. If your
    application requires an internet facing load balancer, for example,
    the cloud controller manager is responsible for installing a
    suitable load balancer on the cloud platform.
#### Etcd
The cluster store is the control plane’s only
stateful component, and it persistently saves the cluster’s entire
configuration and state. At the moment, the cluster store is based
on etcd, a popular distributed database. You should run between 3-5
etcd copies for high-availability, and you should provide enough
mechanisms to recover when things go wrong, as it is the cluster’s
sole source of truth.


