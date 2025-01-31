terraform {
  source = "../../../modules/aws-vpc/"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  cidr_block          = "10.0.0.0/16"
  name                = "dev"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones  = ["ap-southeast-1a", "ap-southeast-1b"]
}
