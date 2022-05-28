# vSphere LAB

Ansible Playbooks to manage one or more vSphere 7 Lab created in an isolated manner inside a vCenter Server.

Each vSphere LAB deployment creates several ESXi 7 servers, with a vCenter Server 7 ready to be configured, an iSCSI and a NFS storage for testing, DNS and DHCP services, and a Windows Server station to be used as the student desktop.

The whole infrastructure is based on nested virtualization, so no baremetal servers are necessary for its installation. For now, it is only deployable using a vCenter Server instance already available and configured. Deployment directly on ESXi Servers or VMware Workstation versions will be available soon.

---

![vSphere LAB Infra](vsphere-lab-infra.png)

---

#### Table of contents

- [vSphere LAB](#vsphere-lab)
      - [Table of contents](#table-of-contents)
  - [1. Introduction](#1-introduction)
  - [2. Setup and Pre-reqs](#2-setup-and-pre-reqs)
    - [2.1 Python environment](#21-python-environment)
      - [2.1.1 Alternative route](#211-alternative-route)
    - [2.2 Ansible collections and roles](#22-ansible-collections-and-roles)
    - [2.3 OS extra packages](#23-os-extra-packages)
  - [3. Playbooks](#3-playbooks)
  - [4. Usage](#4-usage)

---

## 1. Introduction

This project aims to help virtualization administrators to build an isolate and temporary vSphere 7 laboratory infrastructure for practicing and testing purposes. Once deployed, the administrator has access to several building blocks necessary to put up a full virtualization infrastructure using vSphere 7, which can be used to study and validate vSphere 7 features, such as vSphere DRS and Storage DRS, vSphere vMotion, vSphere Lifecycle Manager, and many others.

The infrastructure is also prepared to add other products, like VMware vSAN, vSphere 7 with Tanzu, VMware NSX-T. Parameters used in the deployment playbook may be changed to better serve the laboratory purpose.

It is possible to deploy several laboratories in the same vSphere Cluster, limited only by the cluster capacity and the Virtual Distributed Switch upper limit per host. Then, feel free to deploy as many labs your team needs, as many times you find necessary.

**!!! IMPORTANT !!!**

The code provided in this repository is suited for lab environment deployment only.

## 2. Setup and Pre-reqs

First of all, clone this repository for you file system. For the setup purpose, we suggest you use an environment with Python 3, Pipenv and Pyenv (it helps setting up the environment). However, it is possible to use Python 3 directly with the installed modules. 

Throughout this item, an Ubuntu/Debian OS will be considered. But this project may be used with Enterprise Linux distributions as well.

### 2.1 Python environment

Install python packages, python3 and python3-pip, and the install Pipenv module.

~~~
sudo apt update
sudo apt install python3 python3-pip
pip install pipenv
~~~

Then, install Pyenv. You may follow the documentation in [Github](https://github.com/pyenv/pyenv) or execute the commands below if Debian or Ubuntu is being used:

~~~
sudo apt-get update
sudo apt-get install make build-essential libssl-dev zlib1g-dev \
                     libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
                     libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

git clone https://github.com/pyenv/pyenv.git ~/.pyenv

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
~~~

Once installed Pyenv, inside the repository directory, initiate the virtual environment with the following commands:

~~~
pipenv shell
pipenv sync
~~~

All necessary Python modules and also the Python 3.9 will be installed. The python of this virtual environment will need to be referenced later in configurations files.

#### 2.1.1 Alternative route

If you do not wish to install the whole setup for your Python 3 environement, you may use the OS Python executable, and install the necessary modules below:

* ansible (tested version => 5.2.0)
* paramiko (tested version => 2.9.2)
* pyvmomi (tested version => 7.0.3)

### 2.2 Ansible collections and roles

For the vSphere LAB deployment, it is necessary to install the following Roles and Collections:

* Collection [community.vmware](https://docs.ansible.com/ansible/latest/collections/community/vmware/index.html)
* Role [ahuffman.resolv](https://github.com/ahuffman/ansible-resolv)
* Role [mrlesmithjr.nfs-server](https://github.com/mrlesmithjr/ansible-nfs-server)
* Role [ondrejhome.targetcli](https://github.com/OndrejHome/ansible.targetcli)

Considering that you are using Python virtual environment with pipenv, once in the repository dir, execute the following commands:

~~~
pipenv shell
ansible-galaxy collection install -r requirements.yml
ansible-galaxy role install -r requirements.yml 
~~~

### 2.3 OS extra packages

These playbooks access the Virtual Machines via SSH using credentials. For this reason, it is necessary to install *sshpass*:

~~~
sudo apt update
sudo apt install sshpass
~~~

## 3. Playbooks

TO-DO

## 4. Usage

TO-DO