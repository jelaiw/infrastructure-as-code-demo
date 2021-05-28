terraform {
	backend "remote" {
		organization = "ubrite"

		workspaces {
			name = "ccts-informatics"
		}
	}

  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }
  }
  required_version = ">= 0.13"
}

provider "openstack" {
}

resource "openstack_networking_network_v2" "ccts_network" {
	name = "cctsnet"
}

# Note order of DNS servers.
# See Slack at https://uab-rc.slack.com/archives/CL8LHFFD0/p1568833385003500.
resource "openstack_networking_subnet_v2" "ccts_subnet" {
	name = "cctssubnet"
	network_id = openstack_networking_network_v2.ccts_network.id
	cidr = "192.168.99.0/24"
	dns_nameservers = ["172.20.0.137", "8.8.8.8"]
}

data "openstack_networking_network_v2" "internet" {
	name = "bright-external-flat-externalnet"
}

resource "openstack_networking_router_v2" "ccts_router" {
	name = "cctsrouter"
	external_network_id = data.openstack_networking_network_v2.internet.id
}

resource "openstack_networking_router_interface_v2" "ccts_router_interface" {
	router_id = openstack_networking_router_v2.ccts_router.id
	subnet_id = openstack_networking_subnet_v2.ccts_subnet.id
}
