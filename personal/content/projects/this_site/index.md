---
title: About This Site
date: 2024-12-06
---

This site was generated using [hugo](https://gohugo.io), a static site generator. You can find the source code [here](https://github.com/TheodoreHerzfeld/personal).

It is then packaged into a Docker image, which is deployed to my self-hosted and managed Kubernetes cluster. Traffic is routed to to the cluster by a Cloudflare tunnel, which handles encryption, and then on to the container by an ingress controller.

The entire application, from build to deployment, is controlled by code: Github Actions for build, and Terraform for Cloudflare and Kubernetes configuration.

This site uses CI/CD: Github Actions is used to build the Docker image, and ArgoCD deploys the application to the cluster.

I use [Umami](https://umami.is/), a privacy-respecting analytics tool, to gather analytics on this site.