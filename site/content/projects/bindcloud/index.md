---
title: Cloudflared-Proxy and Bindcloud
date: 2024-12-06
---

When I first started selfhosting, one of my earliest projects was to setup a custom DNS proxy. I landed on [Pi-hole](https://pi-hole.net/),
a great option for self-hosting, that not only caches DNS queries for the network, but includes domain-blocking capabilities. With a trove
of publicly avaialable blocklists, it was the perfect solution.

However, after running the instance for a while, I decided to see if I could make it more secure, and more private. I soon learned about
DNS over https (DOH), and decided to implement it.

One of the most common solutions to this is to run [`cloudflared`](https://developers.cloudflare.com/1.1.1.1/encryption/dns-over-https/dns-over-https-client/). This solution is no longer well documented, but it does still work. Wanting to run in Docker, and finding that
the existing official container didn't seem to well support this (this is likely wrong, but I was very early in my selfhosting journey),
I decided, in my infinite wisdom, to create a simple custom Docker container to do the job.

So I did, and pointed my Pi-hole instance at cloudflared, and voila, fully proxied DNS!

This container remained in place for a few years until I decided to bring it into Kubernetes. At this point, there was no reason to re-tool
the solution, as my container had been working for years, but it was time to implement DevOps and move it to Kubernetes. I moved the repo 
into my new Gitlab instance, setup a pipeline, and implemented automated builds. The application now runs in a stack with a simple Bind 
instance that routes external requests for Kubernetes resources to the Core-DNS instance that provides DNS to the cluster.