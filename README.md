# vSphere LAB

Ansible Playbooks to manage one or more vSphere 7 Lab created in an isolated manner inside a vCenter Server.

Each vSphere LAB deployment creates several ESXi 7 servers, with a vCenter Server 7 ready to be configured, an iSCSI and a NFS storage for testing, DNS and DHCP services, and a Windows Server station to be used as the student desktop.

The whole infrastructure is based on nested virtualization, so no baremetal servers are necessary for its installation. For now, it is only deployable using a vCenter Server instance already available and configured. Deployment directly on ESXi Servers or VMware Workstation versions will be available soon.

<!-- ![vSphere LAB Infra](vsphere-lab-infra.png) -->

#### Table of contents

- [vSphere LAB](#vsphere-lab)
      - [Table of contents](#table-of-contents)
  - [1. Introduction](#1-introduction)
  - [2. Pre-reqs](#2-pre-reqs)
  - [3. Installation](#3-installation)
  - [4. Usage](#4-usage)

## 1. Introduction

This project aims to help virtualization administrators to build an isolate and temporary vSphere 7 laboratory infrastructure for practicing and testing purposes. Once deployed, the administrator has access to several building blocks necessary to put up a full virtualization infrastructure using vSphere 7, which can be used to study and validate vSphere 7 features, such as vSphere DRS and Storage DRS, vSphere vMotion, vSphere Lifecycle Manager, and many others.

The infrastructure is also prepared to add other products, like VMware vSAN, vSphere 7 with Tanzu, VMware NSX-T. Parameters used in the deployment playbook may be changed to better serve the laboratory purpose.

It is possible to deploy several laboratories in the same vSphere Cluster, limited only by the cluster capacity and the Virtual Distributed Switch upper limit per host. Then, feel free to deploy as many labs your team needs, as many times you find necessary.

**!!! IMPORTANT !!!**

The code provided in this repository is suited for lab environment deployment only.


## 2. Pre-reqs

Opa

## 3. Installation

Opa

## 4. Usage

Opa