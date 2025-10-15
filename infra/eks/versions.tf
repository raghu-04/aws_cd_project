terraform {
    required_version = ">= 1.6.0"
    
    required_providers {
        aws = {
            source = "hashicorp/aws",
            version = ">= 5.50"
        }
        kubernetes = {
            source = "hashicorp/kubernetes",
            version = ">= 2.30"
        }
        helm = {
            source = "hashicorp/helm",
            version = ">= 2.12"
        }
    }

    backend "s3" {
        bucket = "online-botique-tfstatefile-raghu0410"
        key = "online-boutique/terraform.tfstate"
        region = "us-east-1"
        encrypt = true
        dynamodb_table = "online-boutique-tfstatefile-lock"
    }
}