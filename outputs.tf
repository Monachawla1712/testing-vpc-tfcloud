output "_1_region" {
  description = "AWS Region for the VPC"
  value       = var.region
}

output "_2_vpc_id" {
  description = "The ID of the VPC"
  value = module.vpc.vpc_id
}

output "_3_vpc_cidr_block" {
  description = "IPV4 CIDR Block for this VPC"
  value = module.vpc.vpc_cidr_block
}

output "_4_public_subnets" {
  description = "List of IDs of public subnets"
  value = length(module.vpc.public_subnets) > 0 ? module.vpc.public_subnets : null
}

output "_4_private_subnets" {
  description = "List of IDs of private subnets"
  value = length(module.vpc.private_subnets) > 0 ? module.vpc.private_subnets : null
}

output "_6_database_subnets" {
  description = "List of IDs of database subnets"
  value = length(module.vpc.database_subnets) > 0 ? module.vpc.database_subnets : null
}

output "intra_subnets" {
  description = "Intra Subnet IDs"
  value = length(module.vpc.intra_subnets) > 0 ? module.vpc.intra_subnets : null

}

output "_7_vpn-host-public-ip" {
  description = "IP Address of VPN Server"
  value = var.vpn_server_enabled ? aws_eip.vpn.0.public_ip : null
}

output "_9_local_file" {
  description = "Path of pem file"
  value       = var.vpn_server_enabled ? format("%s-%s-%s-%s", path.module, var.environment, var.name, "vpn-key-pair.pem") : null
}

output "_8_vpn_server_info_pem" {
  description = "VPN PEM file Info "
  value = var.vpn_server_enabled ? "SAVE THIS FILE AS .pem FOR ACCESSING vpn HOST" : null
}

output "pritunl_info" {
  description = "Pritunl Info"
  value       = var.vpn_server_enabled ? "Please check the Pritunl keys and login credentials in 'pritunl-info.txt' file in 'pritunl' folder" : null
}
