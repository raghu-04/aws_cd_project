variable "region" {
  description = "The aws region to create resources"
    type        = string
    default     = "us-east-1"
}

variable "cluster_name" {
    description = "The name of the EKS cluster"
    type        = string
    default     = "online-boutique-eks"
}

variable "vpc_cidr" {
    description = "The CIDR block for the VPC"
    type        = string
    default     = "10.0.0.0/16"
}

variable "az_count" {
    description = "The number of availability zones to use"
    type        = number
    default     = 3
}

variable "k8s_version" {
    description =  "EKS cluster kubernetes version"
    type        = string
    default     = "1.31"
}

variable "node_instance_types" {
    description = "Size of the EKS worker nodes"
    type        = list(string)
    default     = ["t3.medium"]
}

variable "node_desired_size" {
    description = "Desired number of worker nodes"
    type        = number
    default     = 3
}

variable "node_min_size" {
    description = "Minimum number of worker nodes"
    type        = number
    default     = 2
}

variable "node_max_size" {
    description = "Maximum number of worker nodes"
    type        = number
    default     = 5
}