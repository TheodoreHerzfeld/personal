---
title: Cycler - Automated Restarting of Kubernetes Deployments
date: 2024-12-16
---

### [Source Code](https://github.com/TheodoreHerzfeld/cycler)

I believe that in low-risk environments, it can sometimes (_sometimes_) be a good idea to point images at a `latest` tag, and then
push updates to the Docker registry as code changes, so that the deployment configuration can remain consistent. For fast-moving,
very simple apps, this can work quite well. This website is one example.

Unfortunately, Kubernetes does not have a built-in method to determine if there is a new version of a tag available, so normally
the developer must trigger a `rollout restart` of the service to update to the new image in these cases, either with automation,
or manually.

However, if the image and its build pipeline are not controlled by the developer, this may not be an option.

I thought that was annoying, so I set out to fix it.

[Cycler](https://github.com/TheodoreHerzfeld/cycler) is a very simple Python service that scans for deployments in a cluster with
a known annotation, and will trigger a `rollout restart` if any of its containers' SHA digests differ from those on the source
registry.