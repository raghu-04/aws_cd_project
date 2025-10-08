terraform {
  backend "s3" {
    bucket = "online-botique-tfstatefile-raghu0410"
    key = "online-boutique/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    dynamodb_table = "online-boutique-tfstatefile-lock"
  }
}