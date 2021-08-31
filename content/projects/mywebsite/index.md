---
title: "My Website"
date: 2021-04-01T21:55:06+01:00
draft: false
hideLastModified: true
summaryImage: "images/image.png"
keepImageRatio: true
tags: ["devops"]
summary: "My personal website powered by Hugo implementing CI/CD through GitHub actions."
---
# Overview
[This project](https://github.com/franckies/mywebsite) demonstrates how to provide automatic build and deploy of a static website starting from a GitHub repository.
- The GitHub repository is converted into website content using Hugo, an open-source static site generator. The content is then packaged in a Docker image and copied into the GitHub repository generating the .github.io website.
- All the flow is automated using a GitHub action that is triggered on every push event. In this way, the website content can be directly updated from within the GitHub repository by simply editing or adding markdown files.
- All is obtained without writing html/css pages or programming code.

# Hugo 
Hugo is an open-source static site generator, written in Go: it is flexible and quick, files written in markdown syntax are converted into html a lot of predefined templates called themes. It is very useful when building static sites as personal pages, blogs, documentation resources, company or product pages. For my personal website I used the [Refresh theme](https://github.com/PippoRJ/hugo-refresh/tree/2f61f41d97d7955e6de02b84565ec0e18f5fefe8).

# GitHub actions
GitHub actions allows you to create pipelines to automate build and release processes.
Actions are defined in the repository by creating one or more text files, called workflows. The workflows are event-driven: the execution can be triggered by GitHub events like push and pull requests. A wide Marketplace collects plenty of actions from official sources and from contributors.
An event automatically triggers the workflow, which contains one or more jobs. Each job uses steps to control the order in which actions are run. These actions are the actual commands that automate the process.

In this project, a workflow called _build and publish_ has been created, which contains two jobs: 
- *Build & push Docker image*: a new docker image of the website is built and pushed to my dockerhub repository.
- *Deploy the site*: the project is built using Hugo and the result is pushed to another GitHub repository which generates the .github.io site.

