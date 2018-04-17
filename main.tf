
resource "aws_vpc" "default" {
  cidr_block                       = "${var.cidr_block}"
  instance_tenancy                 = "${var.instance_tenancy}"
  enable_dns_hostnames             = "${var.enable_dns_hostnames}"
  enable_dns_support               = "${var.enable_dns_support}"
  enable_classiclink               = "${var.enable_classiclink}"
  enable_classiclink_dns_support   = "${var.enable_classiclink_dns_support}"
  assign_generated_ipv6_cidr_block = true
  tags                             = "${var.tags}"
}

resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.default.id}"
  tags   = "${var.tags}"
}



output "igw_id" {
  value       = "${aws_internet_gateway.default.id}"
  description = "The ID of the Internet Gateway"
}

output "vpc_id" {
  value       = "${aws_vpc.default.id}"
  description = "The ID of the VPC"
}

output "vpc_cidr_block" {
  value       = "${aws_vpc.default.cidr_block}"
  description = "The CIDR block of the VPC"
}

output "vpc_main_route_table_id" {
  value       = "${aws_vpc.default.main_route_table_id}"
  description = "The ID of the main route table associated with this VPC."
}

output "vpc_default_network_acl_id" {
  value       = "${aws_vpc.default.default_network_acl_id}"
  description = "The ID of the network ACL created by default on VPC creation"
}

output "vpc_default_security_group_id" {
  value       = "${aws_vpc.default.default_security_group_id}"
  description = "The ID of the security group created by default on VPC creation"
}

output "vpc_default_route_table_id" {
  value       = "${aws_vpc.default.default_route_table_id}"
  description = "The ID of the route table created by default on VPC creation"
}

output "vpc_ipv6_association_id" {
  value       = "${aws_vpc.default.ipv6_association_id}"
  description = "The association ID for the IPv6 CIDR block"
}

output "ipv6_cidr_block" {
  value       = "${aws_vpc.default.ipv6_cidr_block}"
  description = "The IPv6 CIDR block"
}
