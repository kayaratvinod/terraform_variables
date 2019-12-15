# region / regions where we deploy our infrastructure
#variable "aws_region" {
#       default = "us-east-1"
#}

variable "aws_region" {
}

variable  "vpcCIDRblock" {
        default = "10.0.0.0/16"
}

variable "instanceTenancy" {
    default = "default"
}
variable "dnsSupport" {
    default = true
}
variable "dnsHostNames" {
    default = true
}

variable "subnet_cidr" {
        type = list(string)
        default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "azs" {
        type = list(string)
        default = ["us-east-1a","us-east-1b","us-east-1c"]
}
