terraform {

  # cloud {
  #   organization = "terraform-aws-quicksight-rds"

  #   workspaces {
  #     # tags since each workspace is an environment
  #     # this allows the use of multiple workspaces to be selected
  #     # make sure this tag is on the workspace that this terrafom will use
  #     tags = ["test"]
  #   }
  # }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.3.0"
    }
  }
  required_version = "~> 1.3.7"
}

# Configure the AWS Provider
provider "aws" {
  region  = var.aws_region_primary
  profile = "AWSSandbox"

  default_tags {
    tags = {
      Owner       = "georged"
      Email       = "george@triumphtech.com"
      AWSPartner  = "TriumphTech"
      Environment = var.environment
    }
  }

  alias = "primary"
}

data "local_file" "plan-cost" {
  filename = "plan-cost.json"
}

module "pricing" {
  source = "terraform-aws-modules/pricing/aws//modules/pricing"
  # source       = "./modules/pricing/modules/pricing"
  content      = jsondecode(data.local_file.plan-cost.content)
  debug_output = true
  version      = "2.0.2"
}

# Create a VPC
resource "aws_vpc" "initial_vpc" {
  tags = {
    Name = "initial_vpc"
  }
  cidr_block = "10.0.0.0/16"
  provider   = aws.primary
}

# data "aws_regions" "current" {
#   all_regions = false
# }

# output "aws_regions_list" {
#   value = data.aws_regions.current.names
# }