output "cluster_name" {
    value = module.eks.cluster_name
}

output "cluster_endpoint" {
    value = data.aws_eks_cluster.this.endpoint
}

output "private_subnets" {
    value = module.vpc.private_subnets
}

output "public_subnets" {
    value = module.vpc.public_subnets
}