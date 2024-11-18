terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.76.0"
    }
  }

#   backend "s3" {
#     bucket = "rumo-terraform-on-aws-eks"
#     key    = "dev/eks-cluster/terraform.tfstate"
#     region = "us-east-1" 
 
#     # For State Locking
#     dynamodb_table = "dev-ekscluster"    
#   }  

  backend "s3" {
    bucket  = "rumo-state-bucket"
    key     = "build/terraform.tfstate"
    region  = "us-east-1"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

resource "aws_s3_bucket" "mybucket" {
    bucket = "rumo-mytest-bucket"
}