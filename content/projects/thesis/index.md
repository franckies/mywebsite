---
title: "Augmented Reality ADAS for HMDs"
date: 2019-06-04T21:55:06+01:00
draft: false
hideLastModified: true
summaryImage: "images/ar.jpg"
keepImageRatio: true
tags: ["ar", "hmd", "hololens", "c#"]
summary: "Real time implementation of an augmented reality advanced driver assistant system for Head Mounted Displays."
---
# Overview
This project aims at exploiting the Augmented Reality (AR) technology potential
in vehicles to overlay crucial information for the driver within his/her line of sight,
allowing him/her to stay in the "loop" of driving keeping the eyes on the road.
Nowadays, AR systems utilize Head-Mounted Displays (HMDs) to show virtual
features just in static environments like rooms or workstations. These situations
are the ideal circumstances for the application of localization algorithms, typically
built-in HMDs. In literature, there are not solutions meant for their application
in a constantly moving environment, specifically the road, seen by the driver
in front of the vehicle while driving. The proposed research project aims at
designing a localization algorithm for the presented use-case, integrating it in
a software package. The software package should be directly deployed on an
HMD and consists of two main applications. The former displays to the driver
a virtual instrumental panel fixed in the cockpit, in order to show the vehicle’s
information to the user while maintaining his/her gaze on the road. The latter
highlights obstacles in front of the vehicle detected by an external LiDAR sensor
to promptly alert the driver of an incoming danger. The developed localization
algorithm exploits computer vision techniques to track fiducial features fixed
inside the cockpit in a robust, reliable and efficient way. This is done through the
study of images captured by the cameras integrated in the HMDs. The software
package has been implemented for two different HMDs (HoloLens 1 and ThirdEye
X2), and an accurate analysis has been carried on to identify the advantages and disadvantages of each device.
