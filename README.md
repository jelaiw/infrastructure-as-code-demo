# CCTS Informatics Team OpenStack Infrastructure

### Terraform
The `*.tf` files comprise the Terraform configuration.

In particular:
* `main.tf` contains the backend, provider, and network configuration.
* `hoags.tf` contains a VM configuration.
* `cigar.tf` contains a VM configuration.
* `variables.tf` defines important variables.
* `terraform.tfvars` contains current variable values.

Current VM host naming convention is [named galaxies](https://en.wikipedia.org/wiki/List_of_galaxies).

### Ansible
The `hosts` file is the Ansible inventory.

`setup-qwrap-reports-server.yml` is a QWRAP reports test server playbook.

`setup-gitlab-runner.yml` is a dvctools GitLab Runner playbook.

`setup-docker.yml` is a Docker build box playbook.

`setup-authorized-keys.yml` is a playbook for authorizing ssh keys to specific hosts.
