# maintaing core addons with compatible versions
resource "aws_eks_addon" "vpc_cni" {
    cluster_name = module.eks.cluster_name
    addon_name =  "vpc-cni"
    most_recent = true
    resolve_conflicts_on_create = "OVERWRITE"
    resolve_conflicts_on_update = "OVERWRITE"
}

resource "aws_eks_addon" "coredns" {
    cluster_name = module.eks.cluster_name
    addon_name = "coredns"
    most_recent = true
    resolve_conflicts_on_create = "OVERWRITE"
    resolve_conflicts_on_update = "OVERWRITE"
}

resource "aws_eks_addon" "kube_proxy" {
    cluster_name = module.eks.cluster_name
    addon_name = "kube-proxy"
    most_recent = true
    resolve_conflicts_on_create = "OVERWRITE"
    resolve_conflicts_on_update = "OVERWRITE"
}

resource "aws_eks_addon" "ebs_csi" {
    cluster_name = module.eks.cluster_name
    addon_name = "aws-ebs-csi-driver"
    most_recent = true
    resolve_conflicts_on_create = "OVERWRITE"
    resolve_conflicts_on_update = "OVERWRITE"
}