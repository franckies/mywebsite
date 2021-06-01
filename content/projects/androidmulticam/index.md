---
title: "Android MultiCamera on Unity"
date: 2019-06-04T21:55:06+01:00
draft: true
hideLastModified: true
summaryImage: "images/cover.png"
keepImageRatio: true
tags: ["android", "unity"]
summary: "Simultaneously stream more than one Android camera on Unity."
---
# Overview
The plugin has been developed exploiting **Android Native Development Kit** (NDK),
a toolset that makes it possible to implement parts of an Android application in
native languages such as C or C++. Unity supports native plugins for Android
written in C and C++ and packaged into a .so file. A Shared Object(.so)
file is a dynamic linked library (similar to .dll).
To access the camera, it has been used the Android NDK **Camera2 API**,
which comprises a set of classes and methods to efficiently initialize, open and
stream any camera mounted on an Android device. Unlike the WebCamTexture
API, the Camera2 API allows also simultaneous stream of multiple cameras. This
features has been used for the stereo-camera approach implementation.
The Camera2 API allows to stream live frames coming from the cameras in
many output formats. The most convenient one for image processing is the
YUV_420_888 that is a lossless format. This format is a generic YCbCr format,
capable of describing any 4:2:0 chroma-subsampled planar or semiplanar buffer,
with 8 bits per color sample. Images in this format are always represented by
three separated buffers of data, one for each color plane, always guaranteed such
that buffer 0 is Y, buffer 1 is U(Cb) and buffer 2 is V(Cr). Images taken in the 
YUV_420_888 must be converted in RGB to be correctly processed in the Unity
part. The conversion has been performed in two steps:
1. Swap U and V planes of the YUV_420_888 image.
2. Convert to RGB format using OpenCV built-in **Imgproc.cvtColor(...)**
method.

Before compiling the C++ script, three external functions have been added
for inter-operability with the Unity project:
- StartCamera(...): allows to open and initialize a camera specifying its
ID, the desired resolution and frame rate.
- GetBytes(): a getter to acquire a pointer to the byte array of the last
frame captured by the camera.
- GetLength(): a getter to acquire the length of the byte array of the last
frame captured by the camera. This is useful to map the area of memory
containing the byte array into a byte array object in a C# script in Unity.

{{< figure src="images/ndktounity.png" width="700" >}}