provider "aws" {
    region = "${var.aws_region}"
    profile = "default"
}

resource "aws_vpc" "My_VPC" {
  cidr_block           = var.vpcCIDRblock
  instance_tenancy     = var.instanceTenancy
  enable_dns_support   = var.dnsSupport
  enable_dns_hostnames = var.dnsHostNames
tags = {
    Name = "My VPC"
}
}

#resource "aws_subnet" "subnets" {
#       count = "${length(var.azs)}"
#       vpc_id = "${aws_vpc.My_VPC.id}"
#       cidr_block = "${element(var.subnet_cidr,count.index)}"
#
#tags = {
#       Name = "${element(var.azs,count.index)}"
#}
#}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "primary" {
        count = "${length(data.aws_availability_zones.available.names)}"
        availability_zone = "${element(data.aws_availability_zones.available.names,count.index)}"
        vpc_id = "${aws_vpc.My_VPC.id}"
        cidr_block = "${element(var.subnet_cidr,count.index)}"
tags = {
        Name = "${element(data.aws_availability_zones.available.names,count.index)} Subnet"
}

}

#resource "aws_subnet" "secondary" {
#        availability_zone = "${data.aws_availability_zones.available.names[1]}"
#        vpc_id = "${aws_vpc.My_VPC.id}"
#        cidr_block = "${element(var.subnet_cidr,0)}"
#
#tags  = {
#        Name = "Secondary_Subnet"
#}
#}
#

output "vpc_id" {
    value = "${aws_vpc.My_VPC.id}"
}
