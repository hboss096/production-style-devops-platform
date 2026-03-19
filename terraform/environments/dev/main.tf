module "networking" {
  source = "../../modules/networking"
  project_name = var.project_name
}

module "compute" {
  source = "../../modules/compute"

  project_name = var.project_name
  instance_type = var.instance_type
  key_name      = var.key_name
  my_ip         = var.my_ip
  vpc_id        = module.networking.vpc_id

  # NEW (ASG)
  ami_id            = var.ami_id
  subnet_ids        = module.networking.public_subnet_ids
  target_group_arn  = module.alb.target_group_arn
}
#
module "alb" {
  source = "../../modules/alb"
  project_name = var.project_name
  vpc_id       = module.networking.vpc_id
  subnet_ids    = module.networking.public_subnet_ids
}
