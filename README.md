# Infrastructure-as-Code Demo
A proof-of-concept implementation with Terraform configuration for an OpenStack provider, a Terraform Cloud remote backend, and various Ansible playbooks for software configuration management.

### Terraform
The `*.tf` files comprise the Terraform configuration.

In particular:
* `main.tf` contains the backend, provider, and network configuration.
* `hoags.tf` contains a VM configuration.
* `cigar.tf` contains a VM configuration.
* `variables.tf` defines important variables.
* `terraform.tfvars` contains current variable values.

Current VM host naming convention is [named galaxies](https://en.wikipedia.org/wiki/List_of_galaxies).

Current remote backend is Terraform Cloud.

### Ansible
The `hosts` file is the Ansible inventory.

The `*.yml` files are Ansible playbooks.

In particular:
* `setup-qwrap-reports-server.yml` is a QWRAP reports test server playbook.
* `setup-gitlab-runner.yml` is a dvctools GitLab Runner playbook.
* `setup-docker.yml` is a Docker build box playbook.
* `setup-authorized-keys.yml` is a playbook for authorizing ssh keys to specific hosts.
