---
title: Uptime-Kuma Terraform Provider
date: 2024-12-06
---

[Uptime-Kuma](https://github.com/louislam/uptime-kuma) is a self-hosted monitoring system. Unfortunately, there is no Terraform provider available for it yet, so, I decided
to write one. Unfortunately, the official API for the application has not been published yet, so I have halted work on the provider
in the meantime.

Nonetheless, it was a great learning experience, and taught me a lot about the internal workings of Terraform and Terraform providers
in general, and gave me some good time working with Go and [Hashicorp's official Terraform development tools](https://www.hashicorp.com/blog/terraform-provider-code-generation-now-in-tech-preview).

You can find the existing source code [here](https://github.com/TheodoreHerzfeld/terraform-provider-uptime-kuma).

I intend to continue work on the provider once the official API is released.