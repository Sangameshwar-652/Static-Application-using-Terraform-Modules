provider "aws" {
  region     = "us-east-1"
  access_key = "your-access-key"
  secret_key = "your-secret-key"
}

module "security" {
  source = "./modules/security-module"
}

module "ec2" {
  source       = "./modules/ec2-module"
  security_ids = [module.security.security_group_id]
}