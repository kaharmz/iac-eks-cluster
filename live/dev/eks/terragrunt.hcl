terraform {
  source = "../../../modules/aws-eks/"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  cluster_name    = "dev-eks"
  cluster_version = "1.29"
  subnets_ids     = dependency.vpc.outputs.private_subnet_ids
  vpc_id          = dependency.vpc.outputs.vpc_id
}

dependency "vpc" {
  config_path = "../vpc"

  mock_outputs = {
    vpc_id               = "mock-vpc-id"
    private_subnet_ids    = ["mock-private-subnet-id"]
  }
}
