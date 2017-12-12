module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.env}-${var.project}-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["${var.region}a", "${var.region}b", "${var.region}c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  database_subnets    = ["10.10.21.0/24", "10.10.22.0/24", "10.10.23.0/24"]

  enable_s3_endpoint = true
  enable_nat_gateway = true

  tags = {
    Terraform = "true"
    Environment = "${var.env}"
    Project = "${var.project}"
    Created_by = "${var.created_by}"
    Updated_by = "${var.updated_by}"
  }
}


