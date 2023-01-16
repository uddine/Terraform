## Sentinel 

Sentinel is an embedded policy-as-code framework integrated with the Terraform Platform

### What is Policy as Code?

When you write code to automate regulatory or governance policies

### Features of Sentinel:

- **Embedded** : enable policy enforcement in the data path to actively reject violating behavior instead of passively detecting.

- **Fine-grained** condition-based policy : Make policy decisions based on the condition of other values

- **Multiple Enforcement Levels - Advisory** : soft and hard-mandatory levels allow policy writers to warn on or reject behaviour

- **External Information** : Source external information to make holistic policy decisions

- **Multi-Cloud Compatible** Ensure infrastructure changes are within the business and regulatory policy across multiple providers

- **Sentinel** is a paid service part of the Team & Governance upgrade package

## Terraform and Consul

Consul is a service networking platform that provides:

- **service discovery** – central registry for services in the network
    - Allows for direct communication, no single point of failure via load balancers

- **service mesh** – managing network traffic between services
    - A communication layer on top of your container application, think middleware

- **application configuration capabilities**

Consul is useful when you have a micro-service or service-oriented architecture with hundred or thousands of services (containerized apps or workloads)

Consul integrates with Terraform in the following ways:

- Remote backend
    - Consul has a Key Value (KV) Store to store configurations

- Consul Provider

## hashicorp vault 

