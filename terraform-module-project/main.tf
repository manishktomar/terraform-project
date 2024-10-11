module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module "security" {
  source = "./modules/security"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source = "./modules/ec2"
  vpc_id = module.vpc.vpc_id
  security_group_id = module.security.web_sg_id
}

module "rds" {
  source = "./modules/rds"
  vpc_id = module.vpc.vpc_id
  db_subnet_group = module.vpc.db_subnet_group_id
  security_group_id = module.security.db_sg_id
}

module "alb" {
  source = "./modules/alb"
  vpc_id = module.vpc.vpc_id
  security_group_id = module.security.alb_sg_id
  subnets = module.vpc.public_subnet_ids
}

module "s3" {
  source = "./modules/s3"
}

module "iam" {
  source = "./modules/iam"
}
