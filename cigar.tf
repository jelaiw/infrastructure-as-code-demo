# Docker build box
resource "openstack_compute_instance_v2" "cigar" {
	name = "cigar"
	image_name = "CentOS-7-x86_64-GenericCloud-1905"
	flavor_name = "m1.medium"
	key_pair = var.admin_key_pair
	security_groups = ["default"]

# Work around race condition.
# See https://github.com/terraform-providers/terraform-provider-openstack/issues/775.
	network {
		uuid = openstack_networking_subnet_v2.ccts_subnet.network_id
	}
}

resource "openstack_compute_floatingip_associate_v2" "cigar_fip" {
	floating_ip = var.cigar_floating_ip
	instance_id = openstack_compute_instance_v2.cigar.id
}
