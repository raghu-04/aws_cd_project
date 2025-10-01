variable "region" {
    type = string
    description = "AWS region"
    default = "us-east-1"
}

variable "ecr_namespace" {
    type = string
    description = "ECR namespace"
    default = "online-boutique"
}

variable "services" {
    type = list(string)
    description = "List of service names"
    default = [
        "adservice",
        "cartservice",
        "checkoutservice",
        "currencyservice",
        "emailservice",
        "frontend",
        "loadgenerator",
        "paymentservice",
        "productcatalogservice",
        "recommendationservice",
        "shippingservice"
    ]
}