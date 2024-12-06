---
title: About this Site
---

This site was generated using [hugo](https://gohugo.io), a static site generator. You can find the source code [here](https://github.com/TheodoreHerzfeld/personal).

It is then packaged into a Docker image, which is deployed to my self-hosted and managed Kubernetes cluster. Traffic is routed to to the application by an Nginx reverse proxy, which encrypts the traffic using a LetsEncrypt issued certificate.

This site uses CI/CD: Github Actions is used to build the Docker image, and ArgoCD deploys the application to the cluster.