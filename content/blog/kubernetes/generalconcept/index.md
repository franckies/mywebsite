---
title: "Kubernetes basics"
date: 2019-06-04T21:55:06+01:00
draft: false
hideLastModified: true
summaryImage: "images/k8s.png"
keepImageRatio: true
tags: ["kubernetes"]
summary: "Kubernetes key principles and functionalities"
---
## Key Principles
Micro-services need to be orchestrated. The best way is to have an orchestrator, like Kubernetes. What does the orchestrator?
- Scheduling: the orchestrator is in charge of matching containers to machines. In other words, the orchestrator chooses on which server the container has to be deployed. This is done according to resource needs (CPU, memory), affinity requirements (X and Y must be on the same machine), labels (X must be put on the “test” machine).
- Replication: the orchestrator is able to run N copies of the same container. This is useful for load balancing purposes.  The final user, just asks to the orchestrator to run the necessary number of copies required to sustain the workload that the container has. The orchestrator therefore is able to auto-scale when needed, replicating a service or decreasing the number of running copies at runtime in a completely automated way.
- Handle machine failures: whenever a server fails, the orchestrator has to take care of moving all the services running on that server to another server that is correctly running. Notice that with containers we don’t have live migration, therefore moving the workload means killing all the services and restarting them on another physical machine. Therefore, all the state is lost.
Notice that Kubernetes does not provide storage support, but it just creates the abstraction for already existing storage. Useful tools and Rook Ceph that provides storage orchestration. An example is the following: You have 4 machines, and in Kubernetes you create a PVC (persistent volume claim). The PVC decides then on which of the 4 machines the data that are sent to the PVC will be stored. This decision is not actually taken by Kubernetes, but is taken by other services, like Rook Ceph, which takes as input some quality parameters (for instance the data have to be replicated 3 times), and make the decision on which physical storage save those data.
### Auto-healing
Kubernetes has a GUI, but is very minimal and used by few people (not like OpenStack). 
It has a completely declarative specification, i.e. you don’t tell Kubernetes how to do, but just what to do. For instance, is that when pushing a micro-service to Kubernetes, you tell how the micro-service will be consumed. A service can be consumed in three ways:
- Only inside: the service will be accessed only within the data center.
- Outside: the service must be reachable from outside the data center.
- Nobody: the service contains some logic and send the output data, without having to be reachable from others.
Kubernetes is based on a control-loop approach. Kubernetes components, are not talking to each other, but are writing things in a shared space, and the interested components execute the related actions by periodically monitoring the messages in the shared space. This is an asynchronous approach. Take the right-side image. The user asks to Kubernetes to create a new pod (modifies action). Kubernetes, check the current state (is the pod already running?), and if the answer is no then Kubernetes aligns the desired state with the state the actual state. This is done by the controller. This approach can be explained with an example:
→ Say the user requests to have one web server running. Then if there are no web server running, Kubernetes starts one web server. If there are 10 web server running, Kubernetes stops 9 web servers! Therefore, the user express a desire and Kubernetes automatically performs the required action to reach the desired state. Without Kubernetes, this was all done by hand, managing the number of instances that were running.
