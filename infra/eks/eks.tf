module "eks" {
    source = "terraform-aws-module/eks/aws"
    version = ">= 21.0"

    cluster_name = var.cluster_name
    cluster_version = var.k8s_version
    cluster_endpoint_public_access = true
    enable_irsa = true

    vpc_id = module.vpc.vpc_id
    subnet_ids = module.vpc.private_subnets

    eks_managed_node_groups = {
        default = {
            instance_types = var.node_instance_types
            desired_size = var.node_desired_size
            min_size = var.node_min_size
            max_size = var.node_max_size
            capacity_type = "ON_DEMAND"
        }
    }
    manage_aws_auth = true
}