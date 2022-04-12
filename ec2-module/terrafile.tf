terraform {
  backend "s3" {
    bucket  = "bucket-labjoao"
    key     = "lab.tfstate"
    region  = "sa-east-1"
    encrypt = true
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.5.0"
    }
  }
}

module "ec2_module" {
  source = "git@github.com:joaomarcosad/terraform-module?ref=v0.2"
  name = "ec2-module"
}

output "ip_address" {
  value = module.servers.ip_address
}