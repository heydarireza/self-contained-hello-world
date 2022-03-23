# Creating Basic WebServer

## Description

This project creates a  deployment of a web server which is hosted a simple html code. It uses a docker swarm and docker compose to build the projects. In this project traefik use as a ingress gateway to show your website. Moreover you can simply modify docker-compose.yaml.j2 to change the replication if you need to increase the number of your services. the default number of web_service is in this project is two.

## Prerequisites 

- [Ansible Installed](https://docs.ansible.com/ansible/latest/installation_guide/index.html)
- SSH access to Server
- Root Access to Server
## How to use

### First Setup
Create a host file configuration for your hosts do you want to manage inspired by following example:


`vi inventory/hosts.yaml`
```
all:
  hosts:
  children:
    musicPlatform:
      hosts:
        ServerIp:
          ansible_connection: ssh
          ansible_user: root
          ansible_become_pass: "password"
          ansible_python_interpreter: /usr/bin/python3
          ansible_become_method: su

```
You should add your ssh key to the server by running following command or your server blocked password access you ask some one with ssh access to add you ssh key to the server:

```console
ssh-copy-id username@ServerIp
```



after copied success fully you can test it by running ssh command without asking password again:

```console
ssh username@ServerIp
```

## Installation
Now you can run `ansible-playbook` command to setup needed packages and start project services or use make to run ansible playbooks

To run all the ansible playbooks you need just run `make build `


### After installation

Enter http://ServerIp/ into your browser's URL . the result should be "Hello World"

### remove installation

To uninstall project you just need run `make cleanup-projects `



