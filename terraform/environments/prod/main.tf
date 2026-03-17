module "networking" {
  source = "../../modules/networking"
  project_name = "prod-devops-platform"
}

module "compute" {
  source = "../../modules/compute"
  project_name  = var.project_name
  instance_type = var.instance_type
  key_name      = var.key_name
  my_ip         = var.my_ip

  vpc_id    = module.networking.vpc_id
  subnet_id = module.networking.public_subnet_ids[0]
}

module "alb" {
  source = "../../modules/alb"
  project_name = var.project_name
  vpc_id       = module.networking.vpc_id
  subnet_ids    = module.networking.public_subnet_ids
  instance_id  = module.compute.instance_id
}
