output "web_public_ip" {
  value = module.compute.public_ip
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}
