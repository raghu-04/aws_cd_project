data "aws_availability_zones" "available" {}

module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    version = ">= 5.0"  

    name = "${var.cluster_name}-vpc"
    cidr = var.vpc_cidr

    azs = slice(data.aws_availability_zones.available.names, 0, var.az_count)

    private_subnets = [for i in range(var.az_count) : cidrsubnet(var.vpc_cidr, 4, i)]
    public_subnets = [ for i in range(var.az_count) : cidrsubnet(var.vpc_cidr, 4, i+8)]

    enable_nat_gateway = true
    single_nat_gateway = true
    enable_dns_hostnames = true
    enable_dns_support = true
}